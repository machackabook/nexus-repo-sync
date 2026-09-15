# Speedway — conceptual time-machine versioning

Bidirectional mesh between GitHub (versioned singularity) and Google Drive (ethereal continuum).

## Loop

1. Hourly Actions cron in this repo stamps `docs/LEDGER-STAMP-N.md`.
2. Pull on `main` is the trigger surface for cascade.yml.
3. Cross-repo waterfall requires an operator-injected secret. Never invent tokens. Never commit tokens.
4. `scripts/env-check.sh` fails closed on empty SHA, missing README, or null numeral.
5. Drive remains the cloud house; GitHub remains the commit history.

## Cron posture

- `.github/workflows/hourly-enhance.yml`
- `.github/workflows/waterfall-hourly.yml`
- `.github/workflows/cascade.yml`

Grok Automations quota may cap conversational hourly runs. In-repo Actions is the heartbeat that survives session restore.
