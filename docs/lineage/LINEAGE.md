# GAIA Symbolic Lineage Map

**Symbol:** `GAIA-137451921129154222`

This map is a pointer layer. It intentionally references historical artifacts instead of copying them forward.

## Root lineage

| Era / layer | Exact reference | Role |
|---|---|---|
| Universal convergence | `docs/engram/2026-09-15-universal-convergence.md` @ `de2b4453961b5a3331c8e12b99208d6d69bd2820` | historical engram root |
| Engram index | `docs/engram/ENGRAM_INDEX.md` | canonical index contract |
| Original ledger | `docs/LEDGER.jsonl` | append-only historical event surface |
| Sync protocol | `docs/sync/GAIA_SYNC_PROTOCOL.md` | multi-agent synchronization contract |
| Adaptive policy | `config/gaia-sync.json` | runtime policy root |

## Symbolic relationship

```text
PAST ENGRAMS
    │
    ├── exact commit reference
    │
    ▼
LINEAGE POINTERS
    │
    ├── current policy
    ├── current state
    └── evolution queue
    │
    ▼
PRESENT RUN
    │
    ├── preflight
    ├── compare
    ├── verify
    └── receipt
    │
    ▼
NEXT RUN
```

## Preservation rule

Historical records are immutable references. New knowledge is appended as a new engram, receipt, commit, or lineage pointer. A later agent must be able to walk backward from current state to the exact historical artifact that informed it.

## Multi-agent rule

Meta, Grok, Gemini, Windows, Termux, and other authorized participants should attach their own identity, runtime, observation timestamp, content hash, and exact commit/receipt reference when publishing new evidence.

A symbolic link is not an access grant and does not imply that an external participant has synchronized any private source.
