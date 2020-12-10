#!/bin/bash
sudo apt-fast install -y \
    libasound2-dev \
    libcurl4-gnutls-dev \
    libfreetype-dev \
    libgl-dev \
    libjack-jackd2-dev \
    libopus-dev \
    libx11-dev \
    libxcursor-dev \
    libxext-dev \
    libxinerama-dev \
    libxrandr-dev
git clone https://github.com/essej/sonobus
cd sonobus/Builds/LinuxMakefile
mkdir -pv ~/.vst3
./build.sh
mkdir -pv \
    sonobus/DEBIAN \
    sonobus/usr/bin \
    sonobus/usr/share/applications \
    sonobus/usr/share/pixmaps
cp build/SonoBus sonobus/usr/bin/sonobus
echo '[Desktop Entry]
Type=Application
Name=SonoBus
Exec=sonobus
Icon=sonobus
Categories=AudioVideo;'|tee sonobus/usr/share/applications/sonobus.desktop
cp ../../images/SonoBus-Icon.svg sonobus/usr/share/pixmaps/sonobus.svg
SONOBUS_TAG=`echo $(wget -qO- https://api.github.com/repos/essej/sonobus/releases|grep tag|grep -v Next|head -n1|cut -d \" -f4|sed 's/https:\/\/github.com\/essej\/sonobus\/releases\/tag\///g'|sed 's/v//g')`
SONOBUS_VER=`echo $(git describe --always --dirty)-$(git log -1 --date=short --pretty=format:%cd)|sed 's/v//g'|sed 's/_/-/g'`
echo "Package: sonobus
Version: $SONOBUS_TAG-$SONOBUS_VER
Architecture: amd64
Maintainer: Jesse Chappell <essej@github.com>
Depends: libasound2, libopus0
Section: audio
Priority: optional
Homepage: https://github.com/essej/sonobus
Description: SonoBus is a real-time network audio streaming collaboration tool."|tee sonobus/DEBIAN/control
dpkg-deb -b sonobus .
cd ../../..
cp sonobus/Builds/LinuxMakefile/sonobus*.deb tmp/packages