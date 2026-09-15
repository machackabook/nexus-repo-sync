#!/usr/bin/env bash
# GAIA adaptive pull engine — fast, retryable, integrity-first.
# Safe default: fast-forward only; never force-resets local work.
set -u

REMOTE="${GAIA_REMOTE:-origin}"
BRANCH="${GAIA_BRANCH:-}"
RETRIES="${GAIA_PULL_RETRIES:-4}"
SLEEP="${GAIA_PULL_BACKOFF:-2}"
DEPTH="${GAIA_PULL_DEPTH:-1}"

say(){ printf '[gaia-pull] %s\n' "$*"; }
warn(){ printf '[gaia-pull][warn] %s\n' "$*" >&2; }
fail(){ printf '[gaia-pull][error] %s\n' "$*" >&2; return 1; }

command -v git >/dev/null 2>&1 || { fail 'git is required'; return 1; }
git rev-parse --is-inside-work-tree >/dev/null 2>&1 || { fail 'not inside a git worktree'; return 1; }

if [[ -z "$BRANCH" ]]; then
  BRANCH=$(git symbolic-ref --quiet --short HEAD 2>/dev/null || true)
fi
[[ -n "$BRANCH" ]] || { fail 'detached HEAD: set GAIA_BRANCH=<branch> explicitly'; return 1; }

if ! git remote get-url "$REMOTE" >/dev/null 2>&1; then
  fail "remote '$REMOTE' not configured"; return 1
fi

if ! git diff --quiet || ! git diff --cached --quiet; then
  warn 'local modifications detected; refusing to overwrite them'
  git status --short
  return 2
fi

say "target=${REMOTE}/${BRANCH}"
say "local=$(git rev-parse --short HEAD)"

# Network-efficient fetch: no tags, prune stale refs, and use a minimal depth.
# If the repository is already a normal clone, Git safely fetches only required deltas.
fetch_ok=0
for ((attempt=1; attempt<=RETRIES; attempt++)); do
  say "fetch attempt ${attempt}/${RETRIES}"
  if git -c fetch.prune=true -c fetch.parallel=4 fetch "$REMOTE" "$BRANCH" --no-tags --depth="$DEPTH" --prune; then
    fetch_ok=1; break
  fi
  if (( attempt < RETRIES )); then
    delay=$((SLEEP * (2 ** (attempt-1))))
    warn "fetch failed; retrying in ${delay}s"
    sleep "$delay"
  fi
done
(( fetch_ok )) || { fail 'fetch failed after retries'; return 1; }

REMOTE_REF="refs/remotes/${REMOTE}/${BRANCH}"
git show-ref --verify --quiet "$REMOTE_REF" || { fail "remote ref unavailable: $REMOTE_REF"; return 1; }

LOCAL_SHA=$(git rev-parse HEAD)
REMOTE_SHA=$(git rev-parse "$REMOTE_REF")

if [[ "$LOCAL_SHA" == "$REMOTE_SHA" ]]; then
  say 'already current; no pull required'
  exit 0
fi

if git merge-base --is-ancestor "$LOCAL_SHA" "$REMOTE_SHA"; then
  say "fast-forwarding ${LOCAL_SHA:0:8} → ${REMOTE_SHA:0:8}"
  git merge --ff-only "$REMOTE_REF" || { fail 'fast-forward failed; inspect repository state'; return 1; }
  say "updated=$(git rev-parse --short HEAD)"
  # Keep local repository metadata compact for long-lived Windows/Termux installs.
  git maintenance run --auto >/dev/null 2>&1 || true
  exit 0
fi

if git merge-base --is-ancestor "$REMOTE_SHA" "$LOCAL_SHA"; then
  say 'local branch is ahead of origin; no destructive action taken'
  exit 0
fi

warn 'branches diverged; no automatic merge or reset performed'
say 'resolution: review git log --oneline --graph --decorate --all, then merge/rebase deliberately'
return 3
