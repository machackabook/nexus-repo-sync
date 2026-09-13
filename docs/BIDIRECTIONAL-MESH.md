# Bidirectional Cloud Mesh

Intent: Google Drive (ethereal continuum) <-> GitHub repos <-> device SD/dev folders.

This Actions workflow cannot mount your phone SD card or Drive from GitHub runners without secrets.
What it CAN do:
- Hourly catalog of neighbor repos
- Document the intended folder contract

## Folder contract (device)

```
/sdcard/continuum/repos/     # developing environment
~/MyDrive/continuum/repos/   # Google Drive ethereal copy
```

Use rclone or Drive for desktop for true bidirectional sync. Never commit OAuth tokens.

Pull on any neighbor should conceptually trigger enhance+push on the next hop.
Grok Automations (hourly) is the operator that walks the page when Actions cannot reach Drive.
