[CmdletBinding()]
param([string]$Remote='origin',[string]$Branch='',[int]$Retries=4,[int]$Backoff=2,[int]$Depth=1)
$ErrorActionPreference='Stop'
function Say($m){Write-Host "[gaia-pull] $m"}
function Warn($m){Write-Warning "[gaia-pull] $m"}
if(-not(Get-Command git -ErrorAction SilentlyContinue)){throw 'git is required'}
if((git rev-parse --is-inside-work-tree 2>$null) -ne 'true'){throw 'not inside a git worktree'}
if(-not $Branch){$Branch=git symbolic-ref --quiet --short HEAD 2>$null}
if(-not $Branch){throw 'detached HEAD: provide -Branch'}
git remote get-url $Remote *> $null
if(git status --porcelain){Warn 'local modifications detected; refusing to overwrite them';git status --short;return}
Say "target=$Remote/$Branch"
Say "local=$(git rev-parse --short HEAD)"
$ok=$false
for($attempt=1;$attempt -le $Retries;$attempt++){
  Say "fetch attempt $attempt/$Retries"
  git -c fetch.prune=true -c fetch.parallel=4 fetch $Remote $Branch --no-tags --depth=$Depth --prune
  if($LASTEXITCODE -eq 0){$ok=$true;break}
  if($attempt -lt $Retries){$delay=$Backoff*[math]::Pow(2,$attempt-1);Warn "fetch failed; retrying in ${delay}s";Start-Sleep -Seconds $delay}
}
if(-not $ok){throw 'fetch failed after retries'}
$local=git rev-parse HEAD
$remoteSha=git rev-parse "refs/remotes/$Remote/$Branch"
if($local -eq $remoteSha){Say 'already current; no pull required';return}
git merge-base --is-ancestor $local $remoteSha 2>$null
if($LASTEXITCODE -eq 0){Say "fast-forwarding $($local.Substring(0,8)) -> $($remoteSha.Substring(0,8))";git merge --ff-only "refs/remotes/$Remote/$Branch";Say "updated=$(git rev-parse --short HEAD)";git maintenance run --auto 2>$null;return}
git merge-base --is-ancestor $remoteSha $local 2>$null
if($LASTEXITCODE -eq 0){Say 'local branch is ahead of origin; no destructive action taken';return}
Warn 'branches diverged; no automatic merge or reset performed'
Say 'resolution: review git log --oneline --graph --decorate --all, then merge/rebase deliberately'
return
