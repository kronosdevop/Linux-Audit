#!/bin/bash

# Verify firewall status
echo "Checking firewall status..."
ufw status || iptables -L

# Report open ports and associated services
echo -e "\nReporting open ports and their associated services..."
netstat -tuln

# Check for IP forwarding or insecure network configurations
echo -e "\nChecking for IP forwarding or insecure network configurations..."
sysctl net.ipv4.ip_forward
sysctl net.ipv6.conf.all.forwarding
