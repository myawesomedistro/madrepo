#!/bin/bash
set -e
GDU_TAG=$(wget -qO- https://api.github.com/repos/dundee/gdu/releases|grep tag|head -n1|cut -d \" -f4|sed 's/https:\/\/github.com\/dundee\/gdu\/releases\/tag\/v//g')
mkdir -p gdu/DEBIAN gdu/usr/bin
aria2c $(wget -qO- https://api.github.com/repos/dundee/gdu/releases|grep browser_download_url|grep linux-amd64|head -n1|cut -d \" -f4)
tar -xvzf gdu-linux-amd64.tgz
mv gdu-linux-amd64 gdu/usr/bin/gdu
echo "Package: gdu
Priority: optional
Section: misc
Maintainer: Daniel Milde <daniel@milde.cz>
Architecture: amd64
Version: $GDU_TAG
Homepage: https://github.com/dundee/gdu
Description: Pretty fast disk usage analyzer written in Go."|tee gdu/DEBIAN/control
dpkg-deb -b gdu .
cp gdu*.deb tmp/packages