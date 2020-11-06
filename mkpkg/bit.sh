#!/bin/bash
BIT_TAG=$(wget -qO- https://api.github.com/repos/chriswalz/bit/releases|grep tag|head -n1|cut -d \" -f4|sed 's/https:\/\/github.com\/chriswalz\/bit\/releases\/tag\/v//g')
aria2c $(wget -qO- https://api.github.com/repos/chriswalz/bit/releases|grep browser_download_url|grep linux_amd64.tar.gz|head -n1|cut -d \" -f4)
tar -xzvf bit*linux_amd64.tar.gz
mkdir -pv bit-package/DEBIAN bit-package/usr/bin
cp -rf bit bit-package/usr/bin/bit
chmod +x -v bit-package/usr/bin/bit
echo "Package: bit
Priority: optional
Section: misc
Maintainer: Chris Walz <chriswalz@github.com>
Architecture: amd64
Version: $BIT_TAG
Depends: git
Homepage: https://github.com/vinceliuice/Tela-icon-theme
Description: Bit is an experimental modernized git CLI built on top of git that provides happy defaults and other niceties"|tee bit-package/DEBIAN/control
dpkg-deb -b bit-package .
rm -rf bit bit-package* bit*.tar.gz LICENSE README.md
cp bit*.deb tmp/packages