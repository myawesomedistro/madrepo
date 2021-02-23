#!/bin/bash
set -e
#aria2c https://dl.strem.io/linux/v4.4.106/stremio_4.4.106-1_amd64.deb
aria2c $(wget -O- https://www.stremio.com/downloads|grep amd64.deb|cut -d '"' -f222)
aria2c http://ftp.debian.org/debian/pool/non-free/f/fdk-aac/$(wget -O- http://ftp.debian.org/debian/pool/non-free/f/fdk-aac/|grep libfdk-aac1|grep amd64.deb|head -n2|tail -n1|cut -d '"' -f8)
aria2c http://mirrors.kernel.org/ubuntu/pool/universe/x/x264/$(wget -O- http://mirrors.kernel.org/ubuntu/pool/universe/x/x264/|grep libx264-152|grep amd64.deb|cut -d '"' -f2)