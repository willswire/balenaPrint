#!/bin/bash

# Copy default cups config files if /data/cups is empty
if [ "$(ls -A /data/cups 2> /dev/null)" == "" ]; then
    echo "Looks like /data/ doesn't have CUPS.."
    mkdir /data/cups
    mv /usr/src/cups/* /data/cups
    echo "Moved default config files to persistent /data/"
fi

# Clear any contents made by the default CUPS installation
echo "Clearing default CUPS configuration files"
rm -r /etc/cups

# Establish SymLink for persistent /data/
echo "Establishing SymLink for CUPS..."
ln -s /data/cups /etc/cups
echo "Establishing SymLink for server.crt"
ln -s /etc/ssl/certs/ssl-cert-snakeoil.pem /etc/cups/ssl/server.crt
echo "Establishing SymLink for server.key"
ln -s /etc/ssl/private/ssl-cert-snakeoil.key /etc/cups/ssl/server.key

# Restart CUPS
echo "Initialization complete: Restarting CUPS"
/etc/init.d/cups restart

# Change password to defaultpassword for root user
echo "Setting default password for CUPS"
echo -e "defaultpassword\ndefaultpassword" | (passwd root)
