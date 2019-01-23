#!/bin/bash

# Start dbus
echo "Starting dbus service..."
/etc/init.d/dbus start

# Start dbus
echo "Starting avahi service..."
/etc/init.d/avahi-daemon start
