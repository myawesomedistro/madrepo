#!/bin/bash
set -e
#aria2c https://dl.strem.io/linux/v4.4.106/stremio_4.4.106-1_amd64.deb
aria2c $(wget -O- https://www.stremio.com/downloads|grep amd64.deb|cut -d '"' -f222)
aria2c http://ftp.us.debian.org/debian/pool/non-free/f/fdk-aac/$(wget -O- http://ftp.us.debian.org/debian/pool/non-free/f/fdk-aac/|grep libfdk-aac1|grep amd64.deb|tail -n1|cut -d '"' -f8)