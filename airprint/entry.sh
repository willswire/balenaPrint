#!/bin/bash

# Change password to defaultpassword for root user
echo "Setting default password for CUPS"
echo 'root:defaultpassword' | chpasswd

# Disable dbus for avahi so it can run in docker
sed -i -r 's/#enable-dbus=yes/enable-dbus=no/' /etc/avahi/avahi-daemon.conf

# Start the CUPS service
echo "CUPS and AVAHI services starting..."
cupsd -f & avahi-daemon --no-rlimits
