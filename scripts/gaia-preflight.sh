#!/usr/bin/env bash
set -u

repo="$(git rev-parse --show-toplevel 2>/dev/null || true)"
branch="$(git symbolic-ref --quiet --short HEAD 2>/dev/null || true)"
remote="$(git remote get-url origin 2>/dev/null || true)"
clean="false"
if [[ -n "$repo" ]] && git diff --quiet && git diff --cached --quiet; then clean="true"; fi
shallow="false"
if [[ -f "$repo/.git/shallow" ]]; then shallow="true"; fi

json_escape() { printf '%s' "$1" | sed 's/\\/\\\\/g; s/"/\\"/g'; }

git_version="$(git --version 2>/dev/null || true)"
os_name="$(uname -s 2>/dev/null || printf unknown)"

printf '{"schema":"gaia-preflight/v1","repo":"%s","branch":"%s","remote":"%s","worktree_clean":%s,"shallow":%s,"git":"%s","os":"%s","status":"%s"}\n' \
  "$(json_escape "$repo")" "$(json_escape "$branch")" "$(json_escape "$remote")" \
  "$clean" "$shallow" "$(json_escape "$git_version")" "$(json_escape "$os_name")" \
  "$( [[ "$clean" == true && -n "$remote" && -n "$branch" ]] && printf PASS || printf NEEDS_REVIEW )"

[[ "$clean" == true && -n "$remote" && -n "$branch" ]] || exit 2
