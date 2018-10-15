#!/bin/bash

# Edit the privelages for the CUPS GUI
cupsctl --remote-admin --remote-any --share-printers

# Allow loopback
iptables -I INPUT 1 -i lo -j ACCEPT

# Allow Resin required ports
iptables -A INPUT -p tcp -m tcp -m multiport ! --dports 631 -j DROP
iptables -A OUTPUT -p tcp -m tcp -m multiport ! --dports 631 -j DROP

# Allow DNS
iptables -A OUTPUT -p udp --dport 53 -j ACCEPT

# Now, allow connections to Resin and Pubnub on port 80 and 443
iptables -A OUTPUT -p tcp -d resin.io -m multiport --dports 80,443 -j ACCEPT
iptables -A INPUT -p tcp -d resin.io -m multiport --dports 80,443 -j ACCEPT

iptables -A OUTPUT -p tcp -d pubnub.com -m multiport --dports 80,443 -j ACCEPT
iptables -A INPUT -p tcp -d pubnub.com -m multiport --dports 80,443 -j ACCEPT
