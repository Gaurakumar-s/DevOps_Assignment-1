# Task 3: journalctl

## What I did
Ran `shellscript.sh` with sudo on my Ubuntu machine/VM (⚠️ requires systemd
running as PID 1 — will NOT work in a plain Docker container or a sandbox
without systemd; run it on a real Ubuntu VM, WSL2 with systemd enabled, or
bare-metal Ubuntu).

```bash
chmod +x shellscript.sh
sudo ./shellscript.sh
```

## Key commands and what they do
| Command | Purpose |
|---|---|
| `journalctl --disk-usage` | How much disk space the journal is using |
| `journalctl -n 20` | Last 20 log lines, system-wide |
| `journalctl -b` | Logs from the current boot only |
| `journalctl -u ssh` | Logs for just the `ssh` service |
| `journalctl -p err` | Only error-priority messages and above |
| `journalctl --since "1 hour ago"` | Time-filtered logs |
| `journalctl -k` | Kernel-only messages |
| `journalctl -f` | Live-follow mode (like `tail -f`) |

## Screenshot
![journalctl service logs](../images/task3_journalctl.png)

## Observations
- `journalctl -u ssh` narrowed the output to only that service's entries — much faster than grepping through `/var/log/syslog`.
- `-p err` is a fast way to check "is anything actually broken" without reading every info-level line.
- `--since`/`--until` are the two flags I'll reach for most in real incident debugging (e.g. "what happened right when the alert fired").

## Interview answer (my own words)
`journalctl` reads systemd's structured, indexed binary log store instead of
flat text files. I use `-u` to scope to a service, `-b` to scope to a boot
session, `-p` to filter by severity, and `-f` to tail it live — that
combination covers almost every debugging scenario I'd hit day to day.
