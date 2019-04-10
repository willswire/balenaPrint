FROM balenalib/raspberrypi3-debian

# Install packages
ENV container docker
RUN install_packages \
    systemd \
    cups \
    avahi-daemon \
    avahi-discover \
    libnss-mdns

# Balena-specified services we don't want running in the container
RUN systemctl mask \
    dev-hugepages.mount \
    sys-fs-fuse-connections.mount \
    sys-kernel-config.mount \
    display-manager.service \
    getty@.service \
    systemd-logind.service \
    systemd-remount-fs.service \
    getty.target \
    graphical.target

COPY entry.sh /usr/bin/entry.sh

RUN systemctl enable cups.service
RUN systemctl enable avahi-daemon.service

STOPSIGNAL 37
VOLUME ["/sys/fs/cgroup"]
VOLUME ["/etc/cups"]
ENTRYPOINT ["/usr/bin/entry.sh"]