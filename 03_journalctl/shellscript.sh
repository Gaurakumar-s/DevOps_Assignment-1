#!/bin/bash
# Task 3: journalctl — practice script
# Run with: sudo bash shellscript.sh
# NOTE: journalctl requires systemd to be running as PID 1 (a real VM,
# WSL2 with systemd enabled, or bare-metal Ubuntu). It will NOT work
# inside most plain Docker containers, since systemd isn't running there.

set -x

# 1. Confirm the journal is available and see its overall disk usage
journalctl --disk-usage

# 2. View the most recent 20 log lines across the whole system
journalctl -n 20 --no-pager

# 3. View logs only from the current boot
journalctl -b --no-pager | tail -n 20

# 4. Check logs for a specific service — ssh is a good one to pick
#    since it's installed on almost every Ubuntu server
systemctl status ssh --no-pager
journalctl -u ssh --no-pager -n 20

# 5. Filter by priority: errors and above only, system-wide
journalctl -p err --no-pager -n 20

# 6. Filter by time range
journalctl --since "1 hour ago" --no-pager -n 20

# 7. Kernel-only messages
journalctl -k --no-pager -n 20

set +x
