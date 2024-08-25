#!/bin/bash

# Identify public vs. private IPs
echo "Identifying public vs. private IPs..."
ip addr show | grep "inet " | awk '{print $2}' | while read ip; do
  if [[ $ip =~ ^10\. ]] || [[ $ip =~ ^192\.168\. ]] || [[ $ip =~ ^172\.(1[6-9]|2[0-9]|3[0-1])\. ]]; then
    echo "$ip is a private IP."
  else
    echo "$ip is a public IP."
  fi
done
