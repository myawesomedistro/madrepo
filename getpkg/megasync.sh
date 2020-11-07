#!/bin/bash
wget -q http://ftp.us.debian.org/debian/pool/main/libr/libraw/$(wget -qO- http://ftp.us.debian.org/debian/pool/main/libr/libraw/|grep amd64.deb|grep libraw19|head -n1|cut -d '"' -f8)