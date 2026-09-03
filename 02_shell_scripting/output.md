# Task 2: Shell Scripting (System Information Script)

## What I did
Ran `shellscript.sh`, which displays system information (current date, hostname, username, disk usage, running processes), prints a message using a variable, prompts for name and roll number using `read -p`, creates directory `hello` with `mkdir`, creates file `process.log` with `touch`, and saves running processes using `>` output redirection.

```bash
chmod +x shellscript.sh
sh shellscript.sh
```

## Key output (see full log in `process.log`)

```text
Current date and time:
Thu Sep  3 19:36:11 IST 2026
Hostname: Gauravs-MacBook-Air.local
Username: gauravkumar
Filesystem        Size    Used   Avail Capacity iused ifree %iused  Mounted on
/dev/disk3s1s1   228Gi    17Gi    22Gi    44%    455k  227M    0%   /
devfs            204Ki   204Ki     0Bi   100%     708     0  100%   /dev
/dev/disk3s6     228Gi   2.0Gi    22Gi     9%       2  227M    0%   /System/Volumes/VM
/dev/disk3s2     228Gi    17Gi    22Gi    44%    2.3k  227M    0%   /System/Volumes/Preboot
/dev/disk3s4     228Gi   807Mi    22Gi     4%     533  227M    0%   /System/Volumes/Update
/dev/disk1s2     500Mi   6.0Mi   481Mi     2%       1  4.9M    0%   /System/Volumes/xarts
/dev/disk1s1     500Mi   6.0Mi   481Mi     2%      36  4.9M    0%   /System/Volumes/iSCPreboot
/dev/disk1s3     500Mi   2.6Mi   481Mi     1%     103  4.9M    0%   /System/Volumes/Hardware
/dev/disk3s5     228Gi   168Gi    22Gi    89%    1.3M  227M    1%   /System/Volumes/Data
map auto_home      0Bi     0Bi     0Bi   100%       0     0     -   /System/Volumes/Data/home
/dev/disk3s1     228Gi    17Gi    22Gi    44%    459k  227M    0%   /System/Volumes/Update/mnt1
Current processes:
  PID TTY           TIME CMD
 1612 ttys000    0:00.10 -zsh
 5652 ttys000    0:00.01 sh shellscript.sh
 1922 ttys004    0:00.01 /bin/zsh -il
 3630 ttys006    0:00.02 /bin/zsh -il
Hello, World!
Enter your name: Gaurav Kumar
Enter your roll no: 10066
My name is Gaurav Kumar
My roll no is 10066
```

## Observations
- Using variables (`variable="Hello, World!"`) allows storing and outputting string values.
- `read -p` allows capturing user input interactively on the command line.
- `mkdir -p` ensures the folder is created safely without throwing an error if it already exists.
- The `>` redirection operator sends output into `process.log`, and `>>` appends the `ps` process table into it.
