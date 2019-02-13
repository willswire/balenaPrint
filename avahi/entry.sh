#!/bin/bash

# Start avahi
echo "Starting avahi service..."
avahi-daemon --no-rlimits --no-drop-root
