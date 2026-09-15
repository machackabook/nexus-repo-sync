#!/usr/bin/env bash
set -euo pipefail
TS=$(date -u +%Y-%m-%dT%H:%M:%SZ)
NUM=137451921129154222
mkdir -p docs
echo "{\"ts\":\"$TS\",\"numeral\":\"$NUM\",\"event\":\"cascade_stamp\",\"hub\":\"nexus-repo-sync\"}" >> docs/LEDGER.jsonl
echo "[cascade] stamped $TS"
cat scripts/cascade_targets.txt 2>/dev/null || true
