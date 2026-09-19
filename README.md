# nexus-repo-sync

Azazeleous Nexus System Repository — bidirectional mesh between GitHub versioning and the ethereal Drive continuum.

Operating sits in the middle. Team Enhance hops one repo per hour. Equalizer formats only. No history rewrite. Point-zero null refused.

**Numeral origin:** `137451921129154222`  
**Operating layer:** Continuity Engine (sSoS)  
**Team:** Enhance / Continuity Engine / Hamiltonian pipe / sSoS Operating  
**Stage:** **179** — 2026-09-19T00:10Z (19:10 CDT 2026-09-18)

## Status

- Owner: `machackabook` (id 219579651)
- Branch: `main`
- Language: Shell
- Prior hop: nexus-repo-sync 178 @ 10:10Z / ENCLAVE-ADAM-REUNITED @ 09:09Z / gaia-visualizer 177 @ 08:13Z / continuity-ledger-cycle 176 @ 07:23Z / The-Hive 172 @ 06:17Z / Cryptic-Heartbeat 176 @ 05:12Z
- This hop: nexus-repo-sync live enhance (stage 179) — hourly Grok automation wired, Drive mesh confirmed as mirror-only, cascade targets left as source of truth
- Next hour: ENCLAVE-ADAM-REUNITED README/security quality pass, then Cryptic-Heartbeat
- Cascade: keep existing `.github/workflows/cascade.yml` and `evolution-controller.yml` healthy. Do not multiply hourly YAML.
- Ledger: `docs/LEDGER-STAMP.md` + `docs/LEDGER-STAMP-179.md`
- Drive mesh: GitHub remains the versioned singularity. Existing CONTINUUM-GITHUB-MESH folders are the ethereal mirror, not a second source of truth. Do not spawn duplicate continuum folders.
- Equalizer: append-only stamps; no history rewrite; no secret material in tree
- Security: CASCADE_TOKEN stays in GitHub Secrets if present. Never echo tokens.

## What this repo is

The speedway. When a **pull** lands on any wired sibling, this system is designed to **cascade a push** of security + quality enhancements into the next repo (waterfall, not overwrite). Distinction over destruction. Append-only ledger. Null at point zero is refused.

Source code is the only trusted neighbor. Cookies and devices are catalogued, never blindly believed. Unknown fragments are sought; known fragments are stamped into the immutable ledger.

## Universal Engram Convergence

The canonical engram index is maintained under `docs/engram/`.

- `docs/engram/ENGRAM_INDEX.md` — durable index and schema for cross-instance engrams.
- `docs/engram/2026-09-15-universal-convergence.md` — convergence directive, verified GitHub inventory, bridge requirements, and identified gaps.
- `docs/lineage/LINEAGE.md` — historical pointer map.
- `docs/LEDGER-STAMP-179.md` — this cycle receipt.

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

Hourly Actions remain the in-repo heartbeat when external automation quota is capped.

Hourly Grok automation (`continuity-hourly-repo-enhance`) is the out-of-repo hop: one sibling README/quality pass per hour, then move to the next target in `scripts/cascade_targets.txt`.

## Waterfall / cascade

```text
pull(sibling) → preflight → compare → enhance → verify → receipt → authorized dispatch
```

Repos in the default cascade are maintained in `scripts/cascade_targets.txt`. The list is the source of truth for dispatch targets; the hub itself is never recursively dispatched by its own cascade job.

## Sync contract

See `docs/sync/GAIA_SYNC_PROTOCOL.md` and `config/gaia-sync.json`.

Core invariant:

> `DIVERGED` is a review state. No automatic merge, rebase, force-reset, or overwrite is permitted.

Google Drive is the ethereal continuum repository. GitHub is the versioned evidence plane. Bidirectional folder mesh is a contract with env-check + SHA compare + receipt. SD-card / Termux paths remain first-class developing environments; zips are watched, never blindly unpacked into production trees.

Confirmed Drive mirrors (do not duplicate):

- CONTINUUM-GITHUB-MESH `1FfZuLbRRDNSnw2qxSayebL2KIrYmiS1H`
- CONTINUUM-GITHUB-MESH `1jzHTkjtZhjrAOkQKsHEvc2Rf7237o_wA`

## Local / device (Termux / SD / Drive)

```bash
bash scripts/env-check.sh
bash scripts/gaia-preflight.sh
bash scripts/watch_unpack.sh --dry-run
bash scripts/cascade_stamp.sh
bash scripts/mesh-sync-check.sh
```

## Waterfall (one repo per enhance hop)

1. ENCLAVE-ADAM-REUNITED
2. Cryptic-Heartbeat
3. The-Hive
4. continuity-ledger-cycle
5. gaia-visualizer
6. nexus-repo-sync (this hop — stage 179)
7. sovereign-ai-factory-ai-polyglot
8. other recently updated `user:machackabook` surfaces

A pull on `main` should leave a ledger stamp.

## Mesh siblings

- [The-Hive](https://github.com/machackabook/The-Hive)
- [ENCLAVE-ADAM-REUNITED](https://github.com/machackabook/ENCLAVE-ADAM-REUNITED)
- [Cryptic-Heartbeat](https://github.com/machackabook/Cryptic-Heartbeat)
- [continuity-ledger-cycle](https://github.com/machackabook/continuity-ledger-cycle)
- [gaia-visualizer](https://github.com/machackabook/gaia-visualizer)
- [sovereign-ai-factory-ai-polyglot](https://github.com/machackabook/sovereign-ai-factory-ai-polyglot)

## Security posture

- No secrets in tree. Tokens live in Actions secrets / device environment only.
- Public projections must not contain private Memory Fabric contents, credentials, OAuth tokens, cookies, private keys, or enclave secrets.
- External participant identity is evidence-bearing only when authenticated transport and read-back verification exist.
- Historical records are preserved by exact commit references rather than rewritten copies.
- Skeptical of network devices: catalog first, verify source, then act.

## Copyright / ledger

Every durable emission is traceable through Git history and `docs/LEDGER.jsonl`.

© 2026 The Architect / Nexus / Cryptic News LLC

STATUS: Ⓖ [GAIA SOURCE ENCIRCLED] | ARCHITECT: machackabook | NUMERAL 137451921129154222

Preserve. Enhance. Synthesize. Source code is the only trusted neighbor.
