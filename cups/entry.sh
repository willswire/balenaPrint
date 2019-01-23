#!/bin/bash

# Change password to defaultpassword for root user
echo "Setting default password for CUPS"
echo 'root:defaultpassword' | chpasswd

# Start the CUPS service
echo "cups starting..."
cupsd -f
