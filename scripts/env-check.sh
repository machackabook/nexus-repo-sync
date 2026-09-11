#!/usr/bin/env bash
# Continuity env check — source-code authority only.
set -euo pipefail
NUMERAL="137451921129154222"
DRIVE_NAME="CRYPTIC-HEARTBEAT-NEXUS-ROOT"
DRIVE_MESH="Ethereal-Continuum-Repos"
DRIVE_MESH_ID="1mm2HZPvfvtubSBbOkv3_3Nfhn8mejyu8"
echo "[env-check] numeral=$NUMERAL"
echo "[env-check] expected Drive root=$DRIVE_NAME"
echo "[env-check] expected Drive mesh=$DRIVE_MESH ($DRIVE_MESH_ID)"
echo "[env-check] expected developing env=SD/Termux"
if command -v git >/dev/null 2>&1; then
  echo "[env-check] git=$(git --version)"
else
  echo "[env-check] git=MISSING"
fi
if command -v unzip >/dev/null 2>&1; then
  echo "[env-check] unzip=ok (watch public/private download trees)"
else
  echo "[env-check] unzip=MISSING"
fi
echo "[env-check] mesh=The-Hive,Cryptic-Heartbeat,gaia-visualizer,ENCLAVE-ADAM-REUNITED"
echo "[env-check] refuse-null=true"
exit 0
