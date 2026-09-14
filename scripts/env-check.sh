#!/usr/bin/env bash
# nexus-repo-sync env check — no credentials, refuse null
set -euo pipefail
NUMERAL="137451921129154222"
echo "[env-check] numeral=${NUMERAL}"
echo "[env-check] pwd=$(pwd)"
command -v git >/dev/null && echo "[env-check] git=$(git --version)" || echo "[env-check] git missing"
if git rev-parse --is-inside-work-tree >/dev/null 2>&1; then
  echo "[env-check] branch=$(git rev-parse --abbrev-ref HEAD)"
  echo "[env-check] head=$(git rev-parse --short HEAD)"
fi
for d in docs scripts .github .github/workflows; do
  if [[ -d "$d" ]]; then echo "[env-check] present $d"; else echo "[env-check] missing $d"; fi
done
for f in README.md docs/PIPELINE.md scripts/env-check.sh; do
  if [[ -f "$f" ]]; then echo "[env-check] file $f"; else echo "[env-check] missing-file $f"; fi
done
echo "[env-check] refuse point-zero null"
echo "[env-check] ok"
