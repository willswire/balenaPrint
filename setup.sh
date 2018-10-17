#!/bin/bash

# Clear any contents made by the default CUPS installation
rm -r /etc/cups/

# Establish SymLink for persistent /data/
ln -s /data/cups /etc/cups

# Restart CUPS
/etc/init.d/cups restart

# Change password to defaultpassword for root user
echo -e "defaultpassword\ndefaultpassword" | (passwd root)
