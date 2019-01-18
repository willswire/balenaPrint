FROM balenalib/raspberrypi3-debian:buster

# Install CUPS
RUN install_packages cups

# Move to WORKDIR
WORKDIR /usr/src/

# Move setup script and CUPS config to filesystem
COPY ./setup.sh ./
COPY ./cups ./cups

# Start app
CMD ["bash", "entry.sh"]
