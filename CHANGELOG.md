# Changelog for balena-cups

All entries are made manually. This project adheres to [Semantic Versioning](http://semver.org/).

## 5.1.0 - 2019-5-5
- Remove Port 631 from cupsd.conf

## 5.0.0 - 2019-5-3

- Remove Avahi (utilizing balenaOS instance)
- Filter IP traffic based on source (enable public device URL)
- Introduce `docker-compose` file to ensure DBUS connectivity
- Add volume and mount to /etc/cups/ for persistence of configuration files
- Verified AirPrint working configuration with Enterprise networks
- Visibility on iOS devices

## 4.1.0 - 2019-5-3

- Remove unused avahi-discover package
- Enable USB functionality

## 4.0.0 - 2019-5-3

- Incorporate custom cupsd.conf for access via public device url

## 3.0.0 - 2019-4-10

- Reduce to single container

## 2.0.0 - 2019-1-18

- Rewrite services into two separate applications
- Enable avahi service to be dependant on running cups instance
- Assign persistent volumes for config files for avahi and cups
- Better performance, better pizza, papa johns

## 1.0.0 - 2019-1-18

- Official Release [Will Walker]
