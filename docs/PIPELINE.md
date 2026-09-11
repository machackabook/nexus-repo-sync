# PIPELINE — nexus-repo-sync v1.3.0

Bidirectional intent:

1. GitHub remains the versioned speedway (Actions + dispatch waterfall).
2. Drive folders remain the ethereal house:
   - `CRYPTIC-HEARTBEAT-NEXUS-ROOT` (`13sLfVC5R8fmCH-HROzrY2OXs2_0xsBZt`)
   - `Ethereal-Continuum-Repos` (`1mm2HZPvfvtubSBbOkv3_3Nfhn8mejyu8`)
3. Device SD / Termux remains the developing environment.
4. A pull on any meshed repo should stamp, push self, then dispatch siblings.

## What Actions do today

- Hourly ledger stamp (`docs/LEDGER-STAMP.md`)
- Commit + push on `main`
- Fan `repository_dispatch` `continuity-cascade` when `CASCADE_TOKEN` exists
- Env-check script as the autocomplete / install-health gate

## What still needs a credentialed runner

True two-way *file bytes* between Drive and Git still require a runner with Drive credentials (not present in public Actions by default). This contract keeps the dispatch graph alive until that runner exists. Grok Automations (hourly) is the second clock — enhance one public README/workflow per hour, then move to the next repo.

## Waterfall

```
pull (any mesh repo)
  → stamp ledger
    → push self
      → repository_dispatch siblings
        → their stamp + push
```

Siblings: The-Hive · Cryptic-Heartbeat · gaia-visualizer · ENCLAVE-ADAM-REUNITED

Numeral: `137451921129154222`
Refuse null at point zero.
