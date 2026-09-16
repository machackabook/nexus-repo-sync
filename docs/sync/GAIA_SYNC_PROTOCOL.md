# GAIA Sync Protocol v1

## Purpose

Provide one conservative synchronization contract that can be executed independently by Windows, Termux, Gemini, Grok, Meta, or other authorized project participants.

## Pipeline

`DISCOVER → PREFLIGHT → FETCH → COMPARE → FAST_FORWARD → VERIFY → RECEIPT → DISPATCH`

No participant may silently merge, rebase, force-reset, overwrite, or claim convergence without evidence.

## Profiles

- `FAST`: minimal network work for healthy links.
- `BALANCED`: default operational mode.
- `RECOVERY`: more retries and longer backoff for unstable links.
- `OFFLINE`: inspect/report only; no network mutation.

## Evidence receipt

Each successful or terminal run should record:

- UTC timestamp
- participant/runtime
- repository and branch
- selected profile
- local SHA before/after
- remote SHA observed
- outcome: `CONVERGED`, `UPDATED`, `LOCAL_AHEAD`, `DIVERGED`, `DENIED`, or `ERROR`
- retry count
- duration when available
- policy/schema revision

Never record credentials, cookies, private keys, or access tokens.

## Multi-agent handoff

Participants share the repository as the durable rendezvous point. A participant should publish an evidence receipt before requesting the next participant to act. The next participant re-reads the current state rather than trusting a prior narrative.

## Safety invariant

`DIVERGED` is a review state, not an invitation to repair automatically. Explicit human authorization is required before any non-fast-forward reconciliation.
