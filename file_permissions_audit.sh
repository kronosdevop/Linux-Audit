#!/bin/bash

# Scan for files and directories with world-writable permissions
echo "Scanning for world-writable files and directories..."
find / -xdev -type d -perm -0002 -print
find / -xdev -type f -perm -0002 -print

# Check for .ssh directories and ensure secure permissions
echo -e "\nChecking for .ssh directories with secure permissions..."
find /home -type d -name ".ssh" -exec chmod 700 {} \;

# Report files with SUID or SGID bits set, particularly on executables
echo -e "\nReporting files with SUID or SGID bits set..."
find / -xdev \( -perm -4000 -o -perm -2000 \) -type f -exec ls -ld {} \;
