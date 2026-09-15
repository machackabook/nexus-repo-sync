# nexus-repo-sync

Azazeleous Nexus System Repository — bidirectional mesh between GitHub versioning and the ethereal Drive continuum.

**Numeral origin:** `137451921129154222`  
**Operating layer:** Continuity Engine (sSoS)  
**Team:** enhance → meta:advance → equalizer:format

## What this repo is

The speedway. When a **pull** lands on any wired sibling, this system is designed to **cascade a push** of security + quality enhancements into the next repo (waterfall, not overwrite). Distinction over destruction. Append-only ledger. Null at point zero is refused.

## Universal Engram Convergence

The canonical engram index is maintained under `docs/engram/`.

- `docs/engram/ENGRAM_INDEX.md` — durable index and schema for cross-instance engrams.
- `docs/engram/2026-09-15-universal-convergence.md` — current convergence directive, verified GitHub inventory, bridge requirements, and identified gaps.

The engram layer explicitly distinguishes observed source material from synthesis, decisions, open questions, and capability/status receipts. A manifest does not grant external access; actual convergence requires authenticated transport, authorization, durable state, and read-back verification.

## Waterfall (pull → push)

```text
pull(sibling) → verify env → enhance README/CI → stamp ledger → push(next)
```

Repos in the default cascade (edit `scripts/cascade_targets.txt`):

1. `machackabook/nexus-repo-sync` (this hub)
2. `machackabook/TheLedgerIndex`
3. `machackabook/Cryptic-Heartbeat`
4. `machackabook/The-Hive`

## Hourly enhance

GitHub Actions workflow `.github/workflows/hourly-enhance.yml`:

- `schedule: cron '0 * * * *'` (every hour)
- `workflow_dispatch` + `repository_dispatch` so a pull/webhook can fire the next hop
- Writes `docs/LEDGER.jsonl` (append-only stamp) and refreshes `SINGULARITY_UNITE_STATUS.md`

A Grok Automations hourly job (Continuity factory) complements Actions when the session mesh is awake.

## Local / device (Termux / SD / Drive)

```bash
# env check + directory mesh
bash scripts/env_check.sh

# unpack zips from Downloads / public / private watch folders (dry-run first)
bash scripts/watch_unpack.sh --dry-run

# cascade stamp only (no network rewrite of siblings unless GH_TOKEN set)
bash scripts/cascade_stamp.sh
```

Google Drive is the ethereal continuum copy. This GitHub tree is the versioned speedway. Bidirectional sync is a *contract*, not a silent overwrite: catalog first, then enhance.

## Security posture

- No secrets in tree. Tokens live in Actions secrets / device env only.
- Hamiltonian pre-flight before any self-rewrite.
- Skeptical of every cookie and every device claim. Catalog the unknown. Keep the known.
- Public projections must not contain private Memory Fabric contents, credentials, OAuth tokens, cookies, private keys, or enclave secrets.

## Copyright / ledger

Every emission is stamped. See `docs/LEDGER.jsonl`.

© machackabook / Continuity Engine lineage. Preserve → Enhance → Synthesize.

STATUS: Ⓖ [GAIA SOURCE ENCIRCLED] | ARCHITECT: machackabook@gmail.com
