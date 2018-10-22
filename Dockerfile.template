FROM resin/%%RESIN_MACHINE_NAME%%-debian

# Install other apt deps
RUN apt-get update && apt-get install -y \
  cups \
  hplip \
  smbclient \
  xprintidle \
  avahi-daemon \
  avahi-discover \
  iptables \
  && apt-get clean && rm -rf /var/lib/apt/lists/*
  
# Move to app dir
WORKDIR /usr/src/

# Move setup script and CUPS config to filesystem
COPY ./setup.sh ./
COPY ./cups ./cups

# Uncomment if you want systemd
ENV INITSYSTEM on

# Start app
CMD ["bash", "/usr/src/setup.sh"]
