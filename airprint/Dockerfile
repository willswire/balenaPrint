FROM balenalib/raspberry-pi-debian:buster

# Install CUPS
RUN install_packages \
    cups \
    avahi-daemon \
    avahi-discover \
    colord \
    cups-filters \
    printer-driver-gutenprint \
    cups-bsd \
    cups-pdf \
    foomatic-db-compressed-ppds \
    hplip \
    printer-driver-hpcups \
    smbclient \
    udev

# Move setup script and CUPS config to filesystem
COPY ./entry.sh ./

# Allow USB devices to connect
ENV UDEV=1

# Start app
CMD ["bash", "entry.sh"]
