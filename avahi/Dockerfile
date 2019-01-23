FROM balenalib/raspberry-pi-debian:buster

# Install CUPS
RUN install_packages \
    avahi-daemon \
    avahi-utils \
    libnss-mdns

# Move setup script and CUPS config to filesystem
COPY ./avahi-daemon.conf /etc/avahi/avahi-daemon.conf

# Start app
ENTRYPOINT ["avahi-daemon", "--no-rlimits"]
