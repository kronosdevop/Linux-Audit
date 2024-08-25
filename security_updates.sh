#!/bin/bash

# Check for available security updates
echo "Checking for available security updates..."
apt update && apt list --upgradable | grep -i security

# Ensure automatic security updates are configured
echo -e "\nEnsuring automatic security updates are configured..."
cat /etc/apt/apt.conf.d/50unattended-upgrades | grep -i "Unattended-Upgrade::Automatic-Reboot"
