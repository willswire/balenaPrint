#!/bin/bash

# Establish SymLink for persistent certificate files - ** should fail if link already exists!
# echo "Establishing SymLink for server.crt..."
# ln -s /etc/ssl/certs/ssl-cert-snakeoil.pem /etc/cups/ssl/server.crt
# echo "Establishing SymLink for server.key..."
# ln -s /etc/ssl/private/ssl-cert-snakeoil.key /etc/cups/ssl/server.key

# Allow access to CUPS Control Panel on Port 80
echo "" >> /etc/cups/cupsd.conf
echo "Port 80" >> /etc/cups/cupsd.conf

# Change password to defaultpassword for root user
echo "Setting default password for CUPS"
echo 'root:defaultpassword' | chpasswd

echo "CUPS and Avahi services starting..."
cupsd -f & avahi-daemon
