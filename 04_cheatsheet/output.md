# Task 4: Linux Command Cheat Sheet

## What I did
Ran `shellscript.sh`, which exercises one representative command from each
cheat-sheet category (navigation, file ops, permissions, processes, disk,
networking, compression) so I practiced them hands-on rather than just
reading them.

```bash
chmod +x shellscript.sh
./shellscript.sh
```

## Screenshot
![cheat sheet command run-through](../images/task4_cheatsheet.png)

## Commands practiced and what each does
| Category | Command | What it does |
|---|---|---|
| Navigation | `pwd`, `ls -la` | Show current directory / list all files with details |
| File ops | `touch`, `cat`, `head`, `grep`, `cp`, `mv` | Create, read, filter, copy, rename files |
| Permissions | `chmod 644` | Set read/write for owner, read-only for group/others |
| Processes | `ps aux` | List all running processes with owner, CPU/mem usage |
| Disk | `df -h`, `du -sh` | Filesystem free space / folder size, human-readable |
| Networking | `ip a` | Show network interfaces and IP addresses |
| Compression | `tar -czvf`, `tar -tzvf` | Create a gzip archive / list its contents without extracting |

## Notes
Full command reference (with more examples per category) is in the main
homework write-up I built while preparing this — see the root `README.md`
for the complete cheat sheet.
