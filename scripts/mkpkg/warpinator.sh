#!/bin/bash
set -e
apt-fast install -y \
    appstream \
    devscripts \
    dh-python \
    gnome-pkg-tools \
    gobject-introspection \
    python3-grpc-tools \
    python3-grpcio
git clone https://github.com/linuxmint/warpinator
cd warpinator
# Check out appropriate branch (1.0.6 is current official, master is development)
#git checkout 1.0.6
dpkg-buildpackage --no-sign
cd ..
mv warpinator*.deb tmp/packages
rm -rf warpinator*