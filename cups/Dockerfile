FROM balenalib/%%BALENA_MACHINE_NAME%%-alpine

# Install CUPS
RUN install_packages \
    bash \
    cups

# Move setup script and CUPS config to filesystem
COPY ./entry.sh ./entry.sh
COPY ./cupsd.conf /etc/cups/cupsd.conf

# Allow USB devices to connect
ENV UDEV 1

# Start app
CMD ["bash", "entry.sh"]
