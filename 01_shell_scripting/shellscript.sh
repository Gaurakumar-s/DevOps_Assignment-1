#!/bin/bash



# Storing system details in variables
CURRENT_DATE=$(date)
MY_HOSTNAME=$(hostname)
CURRENT_USER=$(whoami)

echo "=========================================="
echo "          SYSTEM INFORMATION"
echo "=========================================="
echo "Current Date & Time : $CURRENT_DATE"
echo "Hostname            : $MY_HOSTNAME"
echo "Current Username    : $CURRENT_USER"
echo ""

# Displaying disk usage
echo "=========================================="
echo "              DISK USAGE"
echo "=========================================="
df -h
echo ""

# Taking input from user
echo "=========================================="
echo "           USER INPUT & SETUP"
echo "=========================================="
read -p "Enter directory name to create: " DIR_NAME
read -p "Enter file name to save processes: " FILE_NAME

# Creating directory using mkdir
mkdir -p "$DIR_NAME"
echo "Directory '$DIR_NAME' created."

# Creating file using touch
FILE_PATH="$DIR_NAME/$FILE_NAME"
touch "$FILE_PATH"
echo "File '$FILE_PATH' created."

# Storing running processes using > redirection
ps aux > "$FILE_PATH"
echo "Running processes successfully saved to '$FILE_PATH'."
echo ""

# Showing running processes on terminal
echo "=========================================="
echo "        RUNNING PROCESSES (TOP 10)"
echo "=========================================="
head -n 11 "$FILE_PATH"
echo ""
echo "Full process list saved inside: $FILE_PATH"
echo "=========================================="
