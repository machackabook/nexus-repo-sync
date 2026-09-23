# nexus-repo-sync

Azazeleous Nexus System Repository — bidirectional mesh between GitHub versioning and the ethereal Drive continuum.

Operating sits in the middle. Team Enhance hops one repo per hour. Equalizer formats only. No history rewrite. Point-zero null refused.

**Numeral origin:** `137451921129154222`  
**Operating layer:** Continuity Engine (sSoS)  
**Team:** Enhance / Continuity Engine / Hamiltonian pipe / sSoS Operating  
**Stage:** **261** — 2026-09-23T22:24Z (2026-09-23 17:24 CDT)

## Status

- Owner: `machackabook` (id 219579651)
- Branch: `main`
- Language: Shell
- Compounding tier: **T5 / 96%** (catch-up from 190; prior hop was 4 days stale)
- Prior mesh today: gaia-visualizer @ 22:10Z; The-Hive hop 259 @ 20:08Z; Cryptic-Heartbeat hop 258 @ 22:08Z; ENCLAVE-ADAM-REUNITED hop 254 @ 21:20Z; continuity-ledger-cycle hop 260 @ 20:21Z
- This hop: nexus-repo-sync live enhance (stage 261) — quality catch-up after named four + visualizer pulse. README compound. Ledger stamped. cascade.yml left healthy. No extra hourly YAML. No secrets written.
- Next hour: sovereign-ai-factory-ai-polyglot then continuity-mesh-speedway then other recently updated `user:machackabook` surfaces
- Cascade: keep existing `.github/workflows/cascade.yml` and `evolution-controller.yml` healthy. Do not multiply hourly YAML.
- Ledger: `docs/LEDGER-STAMP.md` + `docs/HOP-261.md`
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
- `docs/HOP-261.md` — this cycle receipt.

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

Hourly Grok automations (`hourly-github-cascade-enhance`, `powerhouse`) walk one sibling per hour. Actions cron remains the in-repo heartbeat.

## Waterfall / cascade

```text
pull(sibling) → preflight → compare → enhance → verify → receipt → authorized dispatch
```

Repos in the default cascade are maintained in `scripts/cascade_targets.txt`. The list is the source of truth for dispatch targets; the hub itself is never recursively dispatched by its own cascade job.

Cross-repo push on pull stays closed until the operator injects `CASCADE_TOKEN`. That is skepticism, not a missing feature.

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

Fails closed on empty SHA, missing README, or point-zero null.
Zips in Downloads / public-download / private-download / omdirectorytrew are watched locally only. Unpack is dry-run first. CI never unpacks operator archives.

## Waterfall (one repo per enhance hop)

1. ENCLAVE-ADAM-REUNITED (254 @ 21:20Z)
2. Cryptic-Heartbeat (258 @ 22:08Z)
3. The-Hive (259 @ 20:08Z)
4. continuity-ledger-cycle (260 @ 20:21Z)
5. gaia-visualizer (257 + later pulse @ 22:10Z)
6. nexus-repo-sync — **261 this hop**
7. sovereign-ai-factory-ai-polyglot ← next hour
8. continuity-mesh-speedway
9. other recently updated `user:machackabook` surfaces

A pull on `main` should leave a ledger stamp.

## Mesh siblings

- [The-Hive](https://github.com/machackabook/The-Hive)
- [ENCLAVE-ADAM-REUNITED](https://github.com/machackabook/ENCLAVE-ADAM-REUNITED)
- [Cryptic-Heartbeat](https://github.com/machackabook/Cryptic-Heartbeat)
- [continuity-ledger-cycle](https://github.com/machackabook/continuity-ledger-cycle)
- [gaia-visualizer](https://github.com/machackabook/gaia-visualizer)
- [sovereign-ai-factory-ai-polyglot](https://github.com/machackabook/sovereign-ai-factory-ai-polyglot)
- [continuity-mesh-speedway](https://github.com/machackabook/continuity-mesh-speedway)

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
