#!/bin/bash

# Prints the current date
echo "Current date and time:"
date

# Prints the hostname
echo "Hostname: $(hostname)"

# Prints the username
echo "Username: $(whoami)"

# Prints the disk usage
df -h

# Prints the running processes
echo "Current processes:"
ps

# Uses variables to store and use data
variable="Hello, World!"
echo $variable

# Takes user input using read -p
read -p "Enter your name: " name
read -p "Enter your roll no: " roll_no
echo "My name is $name"
echo "My roll no is $roll_no"

# Creates a directory using mkdir
mkdir -p hello

# Creates a file using touch
touch process.log

# Stores the running processes information in the file using > output redirection
echo "Process information:" > process.log
ps >> process.log
