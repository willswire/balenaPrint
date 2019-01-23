#!/bin/bash

# Start dbus
echo "Starting dbus and avahi services..."
dbus-daemon & avahi-daemon --no-rlimits --no-drop-root
