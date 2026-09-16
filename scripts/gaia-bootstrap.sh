#!/usr/bin/env bash
set -u
ROOT="${GAIA_ROOT:-$HOME/Æ}"
INSTALL_OPTIONAL="${GAIA_INSTALL_OPTIONAL:-0}"
mkdir -p "$ROOT"/{bin,downloads,logs,docs,tmp}

have(){ command -v "$1" >/dev/null 2>&1; }
say(){ printf '[GAIA] %s\n' "$*"; }

for c in git python3 node npm gh curl; do
  if have "$c"; then say "$c: FOUND"; else say "$c: MISSING"; fi
done

if have git; then
  git config fetch.prune true
  git config fetch.parallel 4
  git config core.untrackedCache true
  git config maintenance.auto true
  git config pull.ff only
  git config merge.ff only
  git config fetch.writeCommitGraph true
  say 'repo-local Git safety/performance configuration applied'
fi

if [[ "$INSTALL_OPTIONAL" == 1 ]]; then
  if have apt-get; then
    say 'apt package manager detected; installing only standard developer prerequisites'
    apt-get update && apt-get install -y git curl python3 python3-pip nodejs npm
  elif have pkg; then
    say 'Termux package manager detected; installing developer prerequisites'
    pkg update -y && pkg install -y git curl python nodejs
  else
    say 'no supported package manager detected; audit only'
  fi
fi

python3 - "$ROOT" <<'PY'
import json, os, shutil, sys, datetime
root=sys.argv[1]
names=['git','python3','node','npm','gh','curl']
data={
 'schema':'gaia-runtime/v1',
 'root':root,
 'checked_at':datetime.datetime.now(datetime.timezone.utc).isoformat(),
 'executables':{n:bool(shutil.which(n)) for n in names},
 'install_mode':'optional-tools-requested' if os.environ.get('GAIA_INSTALL_OPTIONAL')=='1' else 'audit-only'
}
with open(os.path.join(root,'gaia-runtime.json'),'w',encoding='utf-8') as f: json.dump(data,f,indent=2)
PY
say "runtime manifest: $ROOT/gaia-runtime.json"
say 'bootstrap complete; no credentials or tokens were created or stored'
