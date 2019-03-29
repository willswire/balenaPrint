# balena-cups

This project provides an easy way of running CUPS on Balena.io for the Raspberry Pi 3 B/B+. CUPS is a modular printing system for Unix-like computer operating systems which allows a computers to act as a print server, in this case enabling AirPrint capability for legacy printers.

The CUPS management console is available through the Device Public URL.  The default login for CUPS web console is 'root' and 'defaultpassword'.

Key features include:

  - Persistent storage of CUPS configuration files (utilizing symbolic links between /etc/cups and /data/cups)
  - CUPS web console accessible via the Resin.io public device URL
