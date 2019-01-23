#!/bin/bash

# Establish SymLink for persistent certificate files - ** should fail if link already exists!
# echo "Establishing SymLink for server.crt..."
# ln -s /etc/ssl/certs/ssl-cert-snakeoil.pem /etc/cups/ssl/server.crt
# echo "Establishing SymLink for server.key..."
# ln -s /etc/ssl/private/ssl-cert-snakeoil.key /etc/cups/ssl/server.key

# Change password to defaultpassword for root user
echo "Setting default password for CUPS"
echo 'root:defaultpassword' | chpasswd

# Start AVAHI daemon
sed -i -r 's/#enable-dbus=yes/enable-dbus=no/' /etc/avahi/avahi-daemon.conf
/etc/init.d/avahi-daemon start

# Start the CUPS service
echo "CUPS starting..."
cupsd -f
