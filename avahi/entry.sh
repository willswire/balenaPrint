#!/bin/bash

# Start dbus
/etc/init.d/dbus start

# Start avahi
echo "Starting dbus and avahi services..."
avahi-daemon --no-rlimits --no-drop-root
