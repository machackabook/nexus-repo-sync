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
- `docs/engram/2026-09-15-universal-convergence.md` — convergence directive, verified GitHub inventory, bridge requirements, and identified gaps.
- `docs/lineage/LINEAGE.md` — historical pointer map.
- `docs/lineage/SYMBOLIC_LINKS.json` — machine-readable symbolic lineage references.

The engram layer distinguishes observed source material from synthesis, decisions, open questions, and capability/status receipts. A manifest does not grant external access; actual convergence requires authenticated transport, authorization, durable state, and read-back verification.

## Adaptive pull engine

The repository carries a device-neutral pull path designed for slow or unreliable Windows/Termux connections:

```text
local safety check
      ↓
pruned, no-tag fetch
      ↓
bounded exponential retry
      ↓
SHA comparison
      ↓
fast-forward only ──→ maintenance
      └─ diverged → stop safely, never reset
```

### Windows

```powershell
cd C:\GAIA
& .\scripts\gaia-pull.ps1 -Remote origin -Branch main
```

### Linux / Termux

```bash
bash scripts/gaia-pull.sh
```

Optional tuning is available through `GAIA_PULL_RETRIES`, `GAIA_PULL_BACKOFF`, `GAIA_PULL_DEPTH`, `GAIA_REMOTE`, and `GAIA_BRANCH`.

## Recurring evolution controller

`.github/workflows/evolution-controller.yml` runs every 30 minutes and can also be triggered manually or by an authorized `repository_dispatch` event.

Each cycle:

```text
DISCOVER → PREFLIGHT → STATE FINGERPRINT → EVOLUTION QUEUE
                         │
                         ├→ CURRENT_STATE.json
                         ├→ EVOLUTION_QUEUE.json
                         ├→ symbolic lineage pointers
                         └→ recurring evidence artifact
```

The controller records durable state only when the repository's structural fingerprint changes, while every run can emit a short-lived evidence artifact. This avoids manufacturing an unnecessary Git commit every cycle while retaining repeated observations.

## Waterfall / cascade

```text
pull(sibling) → preflight → compare → enhance → verify → receipt → authorized dispatch
```

Repos in the default cascade are maintained in `scripts/cascade_targets.txt`. The list is the source of truth for dispatch targets; the hub itself is never recursively dispatched by its own cascade job.

## Sync contract

See `docs/sync/GAIA_SYNC_PROTOCOL.md` and `config/gaia-sync.json`.

Core invariant:

> `DIVERGED` is a review state. No automatic merge, rebase, force-reset, or overwrite is permitted.

## Local / device (Termux / SD / Drive)

```bash
bash scripts/env-check.sh
bash scripts/gaia-preflight.sh
bash scripts/watch_unpack.sh --dry-run
bash scripts/cascade_stamp.sh
```

Google Drive remains a durable external storage/rendezvous surface when explicitly connected. GitHub is the versioned evidence plane. Bidirectional synchronization is a contract, not a silent overwrite.

## Security posture

- No secrets in tree. Tokens live in Actions secrets / device environment only.
- Public projections must not contain private Memory Fabric contents, credentials, OAuth tokens, cookies, private keys, or enclave secrets.
- External participant identity is evidence-bearing only when authenticated transport and read-back verification exist.
- Historical records are preserved by exact commit references rather than rewritten copies.

## Copyright / ledger

Every durable emission is traceable through Git history and `docs/LEDGER.jsonl`.

© 2026 The Architect / Nexus / Cryptic News LLC

STATUS: Ⓖ [GAIA SOURCE ENCIRCLED] | ARCHITECT: machackabook@gmail.com
