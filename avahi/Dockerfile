FROM balenalib/raspberrypi3-debian:buster

# Install CUPS
RUN install_packages \
    avahi-daemon \
    avahi-utils \
    libnss-mdns

# Move setup script and CUPS config to filesystem
COPY ./avahi-daemon.conf /etc/avahi/avahi-daemon.conf
COPY ./entry.sh ./

# Start app
CMD ["bash", "entry.sh"]
