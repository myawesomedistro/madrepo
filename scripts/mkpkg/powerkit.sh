#!/bin/bash
set -e
sudo apt install -y \
    libx11-dev \
    libxrandr-dev \
    libxss-dev \
    qt5-qmake \
    qtbase5-dev
git clone https://github.com/rodlie/powerkit
mkdir -p powerkit/build
cd powerkit/build
qmake PREFIX=/usr CONFIG+=install_udev_rules ..
make
make INSTALL_ROOT=package install
mkdir -p powerkit
mv app/package/* powerkit/
sed -i 's/XFCE;//g' powerkit/etc/xdg/autostart/powerkit.desktop powerkit/usr/share/applications/powerkit.desktop
mkdir -p powerkit/DEBIAN
POWERKIT_TAG=$(curl -su $GAPI_AUTH https://api.github.com/repos/rodlie/powerkit/releases|grep tag|head -n1|cut -d '"' -f4|sed 's/https:\/\/github.com\/rodlie\/powerkit\/releases\/tag\///g')
POWERKIT_VER=`echo $(git describe --always --dirty)-$(git log -1 --date=iso --pretty=format:%cd)|sed 's/\ /-/g'|sed 's/v//g'|sed 's/_/-/g'|sed 's/:/-/g'|cut -d '-' -f2-7`
cat <<EOF |tee powerkit/DEBIAN/control
Package: powerkit
Version: $POWERKIT_TAG-$POWERKIT_VER
Architecture: amd64
Maintainer: Ole-André <rodlie@github.com>
Section: main
Priority: optional
Depends: upower
Homepage: https://github.com/rodlie/powerkit
Description: Powerkit is an lightweight desktop independent full featured power manager, originally created for Slackware for use with alternative desktop environments and window managers, like Fluxbox, Blackbox, FVWM, WindowMaker, Openbox, Lumina, Draco and others.
EOF
dpkg-deb -b powerkit .
cd ../..
mv powerkit/build/powerkit*.deb tmp/packages
rm -rf powerkit*