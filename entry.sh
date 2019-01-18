#!/bin/bash

# Copy default cups config files if /data/cups is empty
if [ "$(ls -A /data/cups 2> /dev/null)" == "" ]; then
    echo "Looks like first install!"
    mkdir /data/cups
    echo "Moving default config files to persistent storage"
    mv /usr/src/cups/* /data/cups
    mkdir /data/cups/ssl
fi

if [ "$(ls -A /data/cups 2> /dev/null)" != "" ]; then
    echo "Existing data found for CUPS"
fi

# Clear any contents made by the default CUPS installation
echo "Clearing default CUPS configuration files..."
rm -r /etc/cups

# Establish SymLink for persistent config files
echo "Establishing SymLink for CUPS..."
ln -s /data/cups /etc/cups

# Establish SymLink for persistent certificate files - ** should fail if link already exists!
echo "Establishing SymLink for server.crt..."
ln -s /etc/ssl/certs/ssl-cert-snakeoil.pem /etc/cups/ssl/server.crt
echo "Establishing SymLink for server.key..."
ln -s /etc/ssl/private/ssl-cert-snakeoil.key /etc/cups/ssl/server.key

# Change password to defaultpassword for root user
echo "Setting default password for CUPS"
echo 'root:defaultpassword' | chpasswd

echo "CUPS Initialization Successful"
/etc/init.d/dbus start
cupsd -f & avahi-daemon
