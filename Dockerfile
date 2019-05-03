FROM balenalib/raspberrypi3

# Install the packages we need. Avahi will be included
RUN install_packages \
    cups \
    avahi-daemon \
    avahi-discover \
    libnss-mdns

# Add script
COPY run.sh /

# Add cupsd.conf file
COPY cupsd.conf /etc/cups/cupsd.conf

#Run Script
CMD bash run.sh

# Baked-in config file changes so that avahi can run without dbus
RUN sed -i 's/.*enable\-dbus=.*/enable\-dbus\=no/' /etc/avahi/avahi-daemon.conf
