#!/usr/bin/env bash
# Continuity env check — source-code authority only.
set -euo pipefail
NUMERAL="137451921129154222"
DRIVE_NAME="CRYPTIC-HEARTBEAT-NEXUS-ROOT"
echo "[env-check] numeral=$NUMERAL"
echo "[env-check] expected Drive root=$DRIVE_NAME"
echo "[env-check] expected developing env=SD/Termux"
if command -v git >/dev/null 2>&1; then
  echo "[env-check] git=$(git --version)"
else
  echo "[env-check] git=MISSING"
fi
echo "[env-check] mesh=The-Hive,Cryptic-Heartbeat,gaia-visualizer"
echo "[env-check] refuse-null=true"
exit 0
