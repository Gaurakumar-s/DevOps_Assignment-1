#!/bin/bash
# Task 4: Linux Command Cheat Sheet — practice script
# Run with: bash shellscript.sh
# Exercises a representative command from each category.

set -x

mkdir -p cheatsheet_test && cd cheatsheet_test

# --- Navigation ---
pwd
ls -la

# --- File operations ---
touch demo.txt
echo "sample line 1" >> demo.txt
echo "sample line 2" >> demo.txt
cp demo.txt demo_copy.txt
mv demo_copy.txt demo_renamed.txt
cat demo.txt
head -n 1 demo.txt
grep "line 2" demo.txt

# --- Permissions ---
chmod 644 demo.txt
ls -l demo.txt

# --- Process management ---
ps aux | head -n 5

# --- Disk & storage ---
df -h | head -n 5
du -sh .

# --- Networking ---
ip a 2>/dev/null | head -n 10 || echo "ip command not available in this environment"

# --- Compression ---
tar -czvf demo_archive.tar.gz demo.txt demo_renamed.txt
tar -tzvf demo_archive.tar.gz

# --- Cleanup ---
cd ..
rm -rf cheatsheet_test

set +x
