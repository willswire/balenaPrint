#!/bin/bash

# Copy default cups config files if /data/cups is empty
if [ "$(ls -A /data/cups 2> /dev/null)" == "" ]; then
    mkdir /data/cups
    mv /usr/src/cups/* /data/cups
fi

# Clear any contents made by the default CUPS installation
rm -r /etc/cups

# Establish SymLink for persistent /data/
ln -s /data/cups /etc/cups

# Restart CUPS
/etc/init.d/cups restart

# Change password to defaultpassword for root user
echo -e "defaultpassword\ndefaultpassword" | (passwd root)
