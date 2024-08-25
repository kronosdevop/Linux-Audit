#!/bin/bash

# List all users and groups
echo "Listing all users and groups..."
getent passwd
getent group

# Check for users with UID 0
echo -e "\nChecking for users with UID 0..."
awk -F: '($3 == "0") {print $1}' /etc/passwd

# Identify users without passwords or with weak passwords
echo -e "\nIdentifying users without passwords or with weak passwords..."
awk -F: '($2 == "" || length($2) < 8) {print $1 " has no password or a weak password"}' /etc/shadow
