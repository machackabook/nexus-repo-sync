# SPEEDWAY HOP 196

Versioning as time-machine:

1. Pull on any watched branch fires `.github/workflows/cascade-on-pull.yml`.
2. Hourly cron fires `.github/workflows/hourly-enhance.yml` and `waterfall-hourly.yml`.
3. Team Enhance moves to the next public repo after each successful stamp.
4. Meta advances documentation. Equalizer is format-only (markdown lint, script shebang, no secret leak).
5. Security: no tokens in tree. Fail-closed if `NEXUS_CASCADE_TOKEN` missing.

Local device loop (Termux / sdcard / Drive) stays on-device. This repo documents the contract; it does not impersonate the phone filesystem.
