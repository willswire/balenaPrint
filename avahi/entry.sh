#!/bin/bash

# Start avahi
echo "Starting avahi service..."
rm -rf /etc/avahi/services/ssh.service
avahi-daemon --no-rlimits --no-drop-root
