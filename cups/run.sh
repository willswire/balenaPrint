#!/bin/bash

# Tell the container that DBUS should report to Host OS
export DBUS_SYSTEM_BUS_ADDRESS=unix:path=/host/run/dbus/system_bus_socket

# Set rules for connection only through the public device URL
iptables -A INPUT -i resin-vpn -m state --state ESTABLISHED,RELATED -j ACCEPT
iptables -A INPUT -p tcp --dport 80 -i resin-vpn -j ACCEPT
iptables -A INPUT -p tcp --dport 80 -j REJECT

echo "Starting CUPS"
lpinfo -m
cupsd -f &


echo "Configuring HP Printers"
if [[ -n "$HP_IP_PRINTERS" ]]; then
  printers=$(echo $HP_IP_PRINTERS | tr ";" "\n")
  for printer in $printers
  do
    echo "Make URI for $printer"
    url=$(hp-makeuri -c $printer)
    if [ $? -eq 0 ]; then
      echo "Found URL: $url"
      echo "Checking to see if printer is in CUPS already"
      lpstat -v | grep -Fe "$url"
      if [ $? -ne 0 ]; then
        echo "Configuring [$printer]"
        hp-setup -i -a -x $printer
      else
        echo "Printer $printer already in CUPS with url: $url"
      fi
    else
      echo "Couldn't find printer on network: $printer"
    fi 
  done
else
  echo "No HP IP Printers to configure"
fi

wait
