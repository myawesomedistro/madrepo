#!/bin/bash
set -e
GDU_TAG=$(curl -su $GAPI_AUTH https://api.github.com/repos/dundee/gdu/releases|grep tag|head -n1|cut -d '"' -f4|sed 's/https:\/\/github.com\/dundee\/gdu\/releases\/tag\/v//g')
mkdir -p gdu/DEBIAN gdu/usr/bin
aria2c $(curl -su $GAPI_AUTH https://api.github.com/repos/dundee/gdu/releases|grep browser_download_url|grep linux_amd64|head -n1|cut -d '"' -f4)
tar fxz gdu_linux_amd64.tgz
mv gdu-linux-amd64 gdu/usr/bin/gdu
cat <<EOF |tee gdu/DEBIAN/control
Package: gdu
Priority: optional
Section: misc
Maintainer: Daniel Milde <daniel@milde.cz>
Architecture: amd64
Version: $GDU_TAG
Homepage: https://github.com/dundee/gdu
Description: Pretty fast disk usage analyzer written in Go.
EOF
dpkg-deb -b gdu .
mv gdu*.deb tmp/packages
rm -rf gdu*