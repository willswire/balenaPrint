#!/bin/bash

# Start dbus
echo "Starting dbus service..."
dbus-daemon --fork

# Start avahi
echo "Starting avahi service..."
avahi-daemon --no-rlimits --no-drop-root
