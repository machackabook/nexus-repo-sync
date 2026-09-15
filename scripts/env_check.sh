#!/usr/bin/env bash
set -euo pipefail
echo "[env-check] numeral=137451921129154222"
echo "[env-check] pwd=$(pwd)"
echo "[env-check] user=${USER:-unknown} host=$(hostname 2>/dev/null || echo unknown)"
command -v git >/dev/null && git --version || echo "[env-check] git missing"
command -v python3 >/dev/null && python3 --version || echo "[env-check] python3 missing"
for d in "$HOME/Downloads" "$HOME/storage/downloads" "/sdcard/Download" "./public" "./private" "./omdirectorytrew"; do
  if [ -d "$d" ]; then echo "[env-check] watch-dir OK $d"; else echo "[env-check] watch-dir ABSENT $d"; fi
done
echo "[env-check] GH_TOKEN set? $([ -n "${GH_TOKEN:-}" ] && echo yes || echo no)"
echo "[env-check] refuse null at point zero"
