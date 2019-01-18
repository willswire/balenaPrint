FROM balenalib/raspberry-pi-debian:buster

# Install CUPS
RUN install_packages \
    cups \
    avahi-daemon \
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


# Move to WORKDIR
WORKDIR /usr/src/

# Move setup script and CUPS config to filesystem
COPY ./entry.sh ./
COPY ./cups ./cups

# Allow USB devices to connect
ENV UDEV=1

# Start app
CMD ["bash", "entry.sh"]
