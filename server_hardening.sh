#!/bin/bash

# SSH Configuration: Disable password-based login for root
echo "Configuring SSH..."
sed -i 's/^#PermitRootLogin.*/PermitRootLogin prohibit-password/' /etc/ssh/sshd_config
systemctl restart sshd

# Disable IPv6 if not in use
echo -e "\nDisabling IPv6..."
sysctl -w net.ipv6.conf.all.disable_ipv6=1
sysctl -w net.ipv6.conf.default.disable_ipv6=1

# Securing the bootloader
echo -e "\nSecuring the bootloader..."
grub2-mkpasswd-pbkdf2
# (Prompt user to enter a password)

# Firewall Configuration
echo -e "\nConfiguring firewall rules..."
iptables -P INPUT DROP
iptables -P FORWARD DROP
iptables -P OUTPUT ACCEPT
iptables -A INPUT -i lo -j ACCEPT
iptables -A INPUT -m conntrack --ctstate ESTABLISHED,RELATED -j ACCEPT
