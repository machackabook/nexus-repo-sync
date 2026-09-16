[CmdletBinding()]
param(
  [string]$Remote = 'origin',
  [string]$Branch = '',
  [ValidateSet('AUTO','FAST','BALANCED','RECOVERY','OFFLINE')][string]$Profile = 'AUTO',
  [switch]$Receipt
)
$ErrorActionPreference = 'Stop'
function Say($m){ Write-Host "[gaia-sync] $m" }
function Fail($m){ Write-Error "[gaia-sync] $m" }

if(-not (Get-Command git -ErrorAction SilentlyContinue)){ throw 'git is required' }
if((git rev-parse --is-inside-work-tree 2>$null) -ne 'true'){ throw 'not inside a git worktree' }
if(-not $Branch){ $Branch = git symbolic-ref --quiet --short HEAD 2>$null }
if(-not $Branch){ throw 'detached HEAD; specify -Branch' }

$status = git status --porcelain
if($status){ throw 'worktree is not clean; refusing to overwrite local work' }

if($Profile -eq 'AUTO'){
  $Profile = if($env:GAIA_SYNC_PROFILE){ $env:GAIA_SYNC_PROFILE } else { 'BALANCED' }
}

$retries = switch($Profile){ 'FAST'{2} 'RECOVERY'{6} 'OFFLINE'{0} default{4} }
$backoff = switch($Profile){ 'FAST'{1} 'RECOVERY'{4} 'OFFLINE'{0} default{2} }
$depth = if($env:GAIA_PULL_DEPTH){ [int]$env:GAIA_PULL_DEPTH } else { 1 }

Say "profile=$Profile branch=$Branch remote=$Remote"
Say 'preflight PASS: clean worktree'

if($Profile -eq 'OFFLINE'){
  Say 'OFFLINE profile selected; no network operation performed'
  return
}

$attempt = 0
while($true){
  try {
    git fetch $Remote $Branch --prune --no-tags --depth=$depth
    break
  } catch {
    $attempt++
    if($attempt -ge $retries){ throw "fetch failed after $attempt attempts" }
    Say "fetch retry $attempt/$retries in ${backoff}s"
    Start-Sleep -Seconds ([int]($backoff * [math]::Pow(2,$attempt-1)))
  }
}

$local = git rev-parse HEAD
$remoteRef = git rev-parse "$Remote/$Branch"
if($local -eq $remoteRef){ Say "CONVERGED sha=$local"; return }

$base = git merge-base HEAD "$Remote/$Branch"
if($base -eq $local){
  git merge --ff-only "$Remote/$Branch"
  git maintenance run --auto 2>$null
  Say "UPDATED sha=$(git rev-parse HEAD)"
  return
}
if($base -eq $remoteRef){ Say "LOCAL_AHEAD sha=$local"; return }

Say "DIVERGED local=$local remote=$remoteRef"
Fail 'No merge, rebase, or force-reset performed. Resolve divergence explicitly.'
return
