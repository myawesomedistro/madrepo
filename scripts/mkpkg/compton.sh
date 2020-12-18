#!/bin/bash
apt-fast install -y \
  libx11-dev \
  libxcomposite-dev \
  libxdamage-dev \
  libxrender-dev \
  libxrandr-dev \
  libxinerama-dev \
  libconfig-dev \
  libdbus-1-dev libdrm-dev \
  libgl1-mesa-dev \
  libpcre3-dev
git clone https://github.com/tryone144/compton
cd compton
make
apt-fast install -y --no-install-recommends \
  asciidoc \
  docbook-xml \
  xsltproc \
  xmlto
make docs
sudo checkinstall -D -y \
  --install=no \
  --maintainer tryone144@github.com \
  --pkgversion 2-`echo $(git describe --always --dirty)-$(git log -1 --date=short --pretty=format:%cd)|sed 's/v//g'|sed 's/_/-/g'` \
  --requires libconfig9
cd ..
mkdir -pv \
    compton/DEBIAN \
    compton/etc/xdg
dpkg-deb -xv compton/compton*.deb compton
dpkg-deb -e compton/compton*.deb compton/DEBIAN
cp assets/compton.conf compton/etc/xdg/compton.conf
dpkg-deb -b compton .
cp compton*.deb tmp/packages