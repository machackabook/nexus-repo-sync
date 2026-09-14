# nexus-repo-sync

**Team Enhance** mesh router for the machackabook GitHub page.
Operating sits in the middle. Continuity Engine catalogs. Golden Army advances.

Numeral origin: `137451921129154222`  
Refuse point-zero null. Seek proximity. Catalog the unknown.

## Speedway

| Layer | Function |
|-------|----------|
| Hourly waterfall | cron `23 * * * *` stamps ledger, env-checks, fans out `repository_dispatch` |
| Pull then push | a pull on this surface triggers cascade dispatches to sibling repos |
| Drive mesh | Google Drive folder `1mm2HZPvfvtubSBbOkv3_3Nfhn8mejyu8` is the ethereal continuum catalog |
| Env check | `scripts/env-check.sh` — git, folders, numeral, refuse-null |
| Equalizer | format discipline only — no champion metric |

## Cascade siblings

- The-Hive
- Cryptic-Heartbeat
- gaia-visualizer
- ENCLAVE-ADAM-REUNITED
- TheLedgerIndex
- sovereign-ai-factory-ai-polyglot

Secret `CASCADE_TOKEN` (fine-grained PAT with `repo` + `actions` on those repos) is required for fanout. Workflow still stamps locally without it.

## Local cron (Termux / SD card / shelm)

```bash
# every hour, pull this repo then let Actions stamp + cascade
0 * * * * cd "$HOME/nexus-repo-sync" && git pull --ff-only && bash scripts/env-check.sh
```

See [docs/PIPELINE.md](docs/PIPELINE.md) and [docs/BIDIRECTIONAL-MESH.md](docs/BIDIRECTIONAL-MESH.md).

Copyright 2026 machackabook / AzazelDeimos. All emissions ledgered.
