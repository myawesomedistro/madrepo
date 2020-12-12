#!/bin/bash
YOSEMITE_VERSION=`echo $(wget -qO- https://api.github.com/repos/supermarin/YosemiteSanFranciscoFont/commits/master|grep date|head -n 1|cut -d \" -f4|cut -d \: -f1|cut -d \T -f1)`
mkdir -pv fonts-sfns/DEBIAN
git clone https://github.com/supermarin/YosemiteSanFranciscoFont
echo "Package: fonts-sfns
Version: $YOSEMITE_VERSION
Architecture: all
Maintainer: Marin <supermarin@github.com>
Section: fonts
Priority: optional
Multi-Arch: foreign
Homepage: https://github.com/supermarin/YosemiteSanFranciscoFont
Description: The font is adapted from San Francisco – Apple’s new typeface for the Apple Watch. This project was inspired by jenskutilek’s Fira System Font Replacement. The fonts were generated using dtinth's Yosemite System Font Patcher."|tee fonts-sfns/DEBIAN/control
mkdir -pv fonts-sfns/usr/share/fonts/YosemiteSanFranciscoFont/
mv YosemiteSanFranciscoFont/*.ttf fonts-sfns/usr/share/fonts/YosemiteSanFranciscoFont/
rm -rf YosemiteSanFranciscoFont
dpkg-deb -b fonts-sfns .
cp fonts-sfns*.deb tmp/packages