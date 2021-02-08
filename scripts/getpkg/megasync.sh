#!/bin/bash
#aria2c http://ftp.us.debian.org/debian/pool/main/libr/libraw/$(wget -O- http://ftp.us.debian.org/debian/pool/main/libr/libraw/|grep amd64.deb|grep libraw19|head -n1|cut -d '"' -f8)
aria2c http://ftp.us.debian.org/debian/pool/main/libr/libraw/libraw19_0.19.2-2_amd64.deb