#!/usr/bin/env bash
# GAIA adaptive pull engine — fast, retryable, integrity-first.
# Safe default: fast-forward only; never force-resets local work.
set -u

REMOTE="${GAIA_REMOTE:-origin}"
BRANCH="${GAIA_BRANCH:-}"
RETRIES="${GAIA_PULL_RETRIES:-4}"
BACKOFF="${GAIA_PULL_BACKOFF:-2}"
DEPTH="${GAIA_PULL_DEPTH:-1}"

say(){ printf '[gaia-pull] %s\n' "$*"; }
warn(){ printf '[gaia-pull][warn] %s\n' "$*" >&2; }
fail(){ printf '[gaia-pull][error] %s\n' "$*" >&2; }

main(){
  command -v git >/dev/null 2>&1 || { fail 'git is required'; return 1; }
  git rev-parse --is-inside-work-tree >/dev/null 2>&1 || { fail 'not inside a git worktree'; return 1; }

  if [[ -z "$BRANCH" ]]; then
    BRANCH=$(git symbolic-ref --quiet --short HEAD 2>/dev/null || true)
  fi
  [[ -n "$BRANCH" ]] || { fail 'detached HEAD: set GAIA_BRANCH=<branch> explicitly'; return 1; }
  git remote get-url "$REMOTE" >/dev/null 2>&1 || { fail "remote '$REMOTE' not configured"; return 1; }

  if ! git diff --quiet || ! git diff --cached --quiet; then
    warn 'local modifications detected; refusing to overwrite them'
    git status --short
    return 2
  fi

  say "target=${REMOTE}/${BRANCH}"
  say "local=$(git rev-parse --short HEAD)"

  fetch_ok=0
  for ((attempt=1; attempt<=RETRIES; attempt++)); do
    say "fetch attempt ${attempt}/${RETRIES}"
    if git -c fetch.prune=true -c fetch.parallel=4 fetch "$REMOTE" "$BRANCH" --no-tags --depth="$DEPTH" --prune; then
      fetch_ok=1
      break
    fi
    if (( attempt < RETRIES )); then
      delay=$((BACKOFF * (2 ** (attempt-1))))
      warn "fetch failed; retrying in ${delay}s"
      sleep "$delay"
    fi
  done
  (( fetch_ok )) || { fail 'fetch failed after retries'; return 1; }

  remote_ref="refs/remotes/${REMOTE}/${BRANCH}"
  git show-ref --verify --quiet "$remote_ref" || { fail "remote ref unavailable: $remote_ref"; return 1; }
  local_sha=$(git rev-parse HEAD)
  remote_sha=$(git rev-parse "$remote_ref")

  if [[ "$local_sha" == "$remote_sha" ]]; then
    say 'already current; no pull required'
    return 0
  fi

  if git merge-base --is-ancestor "$local_sha" "$remote_sha"; then
    say "fast-forwarding ${local_sha:0:8} → ${remote_sha:0:8}"
    git merge --ff-only "$remote_ref" || { fail 'fast-forward failed; inspect repository state'; return 1; }
    say "updated=$(git rev-parse --short HEAD)"
    git maintenance run --auto >/dev/null 2>&1 || true
    return 0
  fi

  if git merge-base --is-ancestor "$remote_sha" "$local_sha"; then
    say 'local branch is ahead of origin; no destructive action taken'
    return 0
  fi

  warn 'branches diverged; no automatic merge or reset performed'
  say 'resolution: review git log --oneline --graph --decorate --all, then merge/rebase deliberately'
  return 3
}

main "$@"
