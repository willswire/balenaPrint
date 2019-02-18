#!/bin/bash

# Start avahi
echo "Starting avahi service..."
rm -rf /etc/avahi/services/ssh.service /var/run/avahi-daemon/pid
avahi-daemon --no-rlimits --no-drop-root
