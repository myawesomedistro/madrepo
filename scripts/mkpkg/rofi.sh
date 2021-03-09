#!/bin/bash
set -e
CHECK_TAG=$(wget -qO- https://api.github.com/repos/libcheck/check/releases|grep tag|head -n1|cut -d \" -f4|sed 's/https:\/\/github.com\/libcheck\/check\/releases\/tag\///g')
ROFI_TAG=$(wget -qO- https://api.github.com/repos/davatorium/rofi/releases|grep tag|head -n1|cut -d \" -f4|sed 's/https:\/\/github.com\/davatorium\/rofi\/releases\/tag\///g')
sudo apt install -y \
    bison \
    debhelper \
    dh-autoreconf \
    dh-strip-nondeterminism \
    flex \
    gir1.2-harfbuzz-0.0 \
    icu-devtools \
    libbison-dev \
    libcairo-script-interpreter2 \
    libcairo2-dev \
    libfile-stripnondeterminism-perl \
    libgdk-pixbuf2.0-dev \
    libgraphite2-dev \
    libharfbuzz-dev \
    libharfbuzz-gobject0 \
    libice-dev \
    libicu-dev \
    libicu-le-hb-dev \
    libicu-le-hb0 \
    libjpeg-dev \
    libpango1.0-dev \
    libpixman-1-dev \
    libpthread-stubs0-dev \
    librsvg2-dev \
    libsm-dev \
    libstartup-notification0-dev \
    libx11-dev \
    libxau-dev \
    libxcb-ewmh-dev \
    libxcb-icccm4-dev \
    libxcb-randr0-dev \
    libxcb-render0-dev \
    libxcb-shm0-dev \
    libxcb-util-dev \
    libxcb-util0-dev \
    libxcb-xinerama0-dev \
    libxcb-xkb-dev \
    libxcb-xrm-dev \
    libxcb1-dev \
    libxdmcp-dev \
    libxext-dev \
    libxft-dev \
    libxkbcommon-dev \
    libxkbcommon-x11-dev \
    libxrender-dev \
    m4 \
    po-debconf \
    x11proto-core-dev \
    x11proto-dev \
    x11proto-xext-dev \
    xorg-sgml-doctools \
    xtrans-dev
git clone https://github.com/davatorium/rofi
cd rofi
git submodule update --init
autoreconf -i
sudo apt install -y \
    autoconf \
    automake \
    libtool \
    texinfo
git clone https://github.com/libcheck/check
cd check
autoreconf -i
./configure
make
sudo checkinstall -D -y \
    --maintainer libcheck@github.com \
    --pkgversion $CHECK_TAG
cd ..
./configure --prefix=/usr
make
sudo checkinstall -D -y \
    --install=no \
    --maintainer davatorium@github.com \
    --pkgversion $ROFI_TAG \
    --requires 'libxcb-ewmh2, libxcb-xrm0'
cd ..
mv rofi/rofi*.deb tmp/packages
sudo rm -rf rofi*