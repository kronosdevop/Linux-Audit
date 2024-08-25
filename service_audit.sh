#!/bin/bash

# List all running services
echo "Listing all running services..."
systemctl list-units --type=service --state=running

# Ensure critical services are running and properly configured
echo -e "\nChecking for critical services (e.g., sshd, iptables)..."
systemctl is-active sshd
systemctl is-active iptables

# Check for services listening on non-standard or insecure ports
echo -e "\nChecking for services listening on non-standard or insecure ports..."
ss -tuln
