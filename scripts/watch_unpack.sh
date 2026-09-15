#!/usr/bin/env bash
set -euo pipefail
DRY=0
[ "${1:-}" = "--dry-run" ] && DRY=1
ROOTS=("$HOME/Downloads" "$HOME/storage/downloads" "/sdcard/Download" "./public" "./private" "./omdirectorytrew")
DEST="./unpacked"
mkdir -p "$DEST"
found=0
for root in "${ROOTS[@]}"; do
  [ -d "$root" ] || continue
  while IFS= read -r -d '' z; do
    found=1
    echo "[watch] zip $z"
    if [ "$DRY" -eq 1 ]; then echo "[watch] dry-run skip unpack"; continue; fi
    base=$(basename "$z" .zip)
    mkdir -p "$DEST/$base"
    unzip -n -q "$z" -d "$DEST/$base" || echo "[watch] unpack warn $z"
  done < <(find "$root" -maxdepth 2 -type f -name '*.zip' -print0 2>/dev/null || true)
done
[ "$found" -eq 0 ] && echo "[watch] no zips in watch roots"
