# PIPELINE — nexus-repo-sync

Bidirectional intent:

1. GitHub remains the versioned speedway.
2. Drive folder `CRYPTIC-HEARTBEAT-NEXUS-ROOT` remains the ethereal house.
3. Device SD / Termux remains the developing environment.
4. A pull on any meshed repo should eventually stamp and dispatch.

## What Actions can do today

- Hourly ledger stamp (`docs/LEDGER-STAMP.md`)
- Commit + push on `main`
- Fan `repository_dispatch` `continuity-cascade` when `CASCADE_TOKEN` exists

## What still needs a credentialed runner

True two-way file bytes between Drive and Git still require a runner with Drive credentials (not present in public Actions by default). This contract documents the mesh and keeps the dispatch graph alive until that runner exists.

## Waterfall

```
pull (any mesh repo)
  → stamp ledger
    → push self
      → repository_dispatch siblings
        → their stamp + push
```

Numeral: `137451921129154222`
