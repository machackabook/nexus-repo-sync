[CmdletBinding(SupportsShouldProcess)]
param(
  [string]$Root = 'C:\GAIA',
  [switch]$InstallOptionalTools,
  [switch]$ConfigureGit,
  [switch]$CreateDesktopLauncher
)
$ErrorActionPreference = 'Stop'
function Say($m){ Write-Host "[GAIA] $m" }
function Have($n){ return [bool](Get-Command $n -ErrorAction SilentlyContinue) }

New-Item -ItemType Directory -Force -Path $Root, "$Root\bin", "$Root\downloads", "$Root\logs", "$Root\docs", "$Root\tmp" | Out-Null
Set-Location $Root

$checks = @('git','pwsh','python','node','npm','curl')
foreach($c in $checks){ Say ("{0}: {1}" -f $c, $(if(Have $c){'FOUND'}else{'MISSING'})) }

if(Have git){
  git config core.autocrlf true
  git config fetch.prune true
  git config fetch.parallel 4
  git config core.untrackedCache true
  git config maintenance.auto true
}

if($ConfigureGit -and (Have git)){
  git config pull.ff only
  git config merge.ff only
  git config fetch.writeCommitGraph true
  Say 'repo-local Git safety/performance configuration applied'
}

if($InstallOptionalTools){
  if(Have winget){
    $packages = @(
      'Git.Git',
      'Python.Python.3.12',
      'OpenJS.NodeJS.LTS',
      'Microsoft.PowerShell',
      'GitHub.cli',
      'Microsoft.VisualStudioCode'
    )
    foreach($p in $packages){
      Say "checking/installing $p"
      winget install --id $p --exact --accept-source-agreements --accept-package-agreements --silent
    }
  } else {
    Say 'winget not available; no package installation attempted'
  }
}

if(Have gh){
  Say 'GitHub CLI detected'
  gh --version | Select-Object -First 1
}

$manifest = Join-Path $Root 'gaia-runtime.json'
@{
  schema='gaia-runtime/v1'
  root=$Root
  checked_at=(Get-Date).ToUniversalTime().ToString('o')
  executables=@{git=(Have git);python=(Have python);node=(Have node);npm=(Have npm);gh=(Have gh);curl=(Have curl)}
  install_mode=$(if($InstallOptionalTools){'optional-tools-requested'}else{'audit-only'})
} | ConvertTo-Json -Depth 5 | Set-Content -Encoding UTF8 $manifest

Say "runtime manifest: $manifest"
Say 'bootstrap complete; no credentials or tokens were created or stored'
