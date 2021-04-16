#!/bin/bash
set -e
BIT_TAG=$(wget -O- https://api.github.com/repos/chriswalz/bit/releases|grep tag|head -n1|cut -d \" -f4|sed 's/https:\/\/github.com\/chriswalz\/bit\/releases\/tag\/v//g')
aria2c $(wget -O- https://api.github.com/repos/chriswalz/bit/releases|grep browser_download_url|grep linux_amd64.tar.gz|head -n1|cut -d \" -f4)
tar fxz bit*linux_amd64.tar.gz
mkdir -p bit-package/DEBIAN bit-package/usr/bin
mv bit bit-package/usr/bin/bit
chmod +x bit-package/usr/bin/bit
cat <<EOF |tee bit-package/DEBIAN/control
Package: bit
Priority: optional
Section: misc
Maintainer: Chris Walz <chriswalz@github.com>
Architecture: amd64
Version: $BIT_TAG
Depends: git
Homepage: https://github.com/vinceliuice/Tela-icon-theme
Description: Bit is an experimental modernized git CLI built on top of git that provides happy defaults and other niceties
EOF
dpkg-deb -b bit-package .
mv bit*.deb tmp/packages
rm -rf bit*