# Drive ↔ GitHub mesh

Canonical ethereal folder (newest Continuity-Ethereal-Repos):

`https://drive.google.com/drive/folders/1IGGDWmmUTMSPCkrwUGKinawvA9PqmEfr`

Cycle artifact naming:

`TEAM_ENHANCE_CYCLE_YYYY-MM-DD.md` in `docs/` of this repo, mirrored as a Drive text artifact when the upload connector is used.

Env check (human / Termux side, not executed in Actions by default):

```bash
# expected layout hints — adapt to the actual device paths
test -d "$HOME" && echo home_ok
command -v git >/dev/null && echo git_ok
command -v gh >/dev/null && echo gh_ok || echo gh_missing
```

Zip overwatch stays on-device. Do not unpack untrusted zips in CI.
