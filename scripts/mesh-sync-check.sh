#!/usr/bin/env bash
# Continuity env + mesh check. Fails closed. Never prints secrets.
set -euo pipefail
NUMERAL="137451921129154222"
fail() { echo "[mesh-sync-check] FAIL: $1" >&2; exit 1; }

[[ -f README.md ]] || fail "missing README.md"
git rev-parse --verify HEAD >/dev/null 2>&1 || fail "empty SHA / no git HEAD"
sha=$(git rev-parse HEAD)
[[ -n "$sha" && "$sha" != "0000000000000000000000000000000000000000" ]] || fail "point-zero null SHA refused"
grep -q "$NUMERAL" README.md || echo "[mesh-sync-check] WARN: numeral not in README (catalogued)"
echo "[mesh-sync-check] OK sha=${sha:0:12} numeral=$NUMERAL"
exit 0
