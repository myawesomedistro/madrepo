#!/bin/bash
set -e
YOSEMITE_VERSION=`echo $(curl -su $GAPI_AUTH https://api.github.com/repos/supermarin/YosemiteSanFranciscoFont/commits/master|grep date|head -n 1|cut -d '"' -f4|cut -d \: -f1|cut -d \T -f1)`
mkdir -p fonts-sfns/DEBIAN
git clone https://github.com/supermarin/YosemiteSanFranciscoFont
cat <<EOF |tee fonts-sfns/DEBIAN/control
Package: fonts-sfns
Version: $YOSEMITE_VERSION
Architecture: all
Maintainer: Marin <supermarin@github.com>
Section: fonts
Priority: optional
Multi-Arch: foreign
Homepage: https://github.com/supermarin/YosemiteSanFranciscoFont
Description: The font is adapted from San Francisco – Apple’s new typeface for the Apple Watch. This project was inspired by jenskutilek’s Fira System Font Replacement. The fonts were generated using dtinth's Yosemite System Font Patcher.
EOF
mkdir -p fonts-sfns/usr/share/fonts/YosemiteSanFranciscoFont/
mv YosemiteSanFranciscoFont/*.ttf fonts-sfns/usr/share/fonts/YosemiteSanFranciscoFont/
rm -rf YosemiteSanFranciscoFont
dpkg-deb -b fonts-sfns .
mv fonts-sfns*.deb tmp/packages
rm -rf fonts-sfns*