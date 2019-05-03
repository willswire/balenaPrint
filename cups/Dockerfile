FROM balenalib/raspberrypi3

# Install the packages we need. Avahi will be included
RUN install_packages \
    cups \
    iptables \
    avahi-daemon \
    dbus \
    libnss-mdns

# Add script
COPY run.sh /

# Enable USB devices
ENV UDEV 1

# Add cupsd.conf file
COPY cupsd.conf /etc/cups/cupsd.conf

#Run Script
CMD bash run.sh
