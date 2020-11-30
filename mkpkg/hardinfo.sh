#!/bin/bash
sudo apt-fast install -y \
    cmake \
    libgtk2.0-dev \
    libjson-glib-dev \
    libsoup2.4-dev \
    libx11-dev
git clone https://github.com/lpereira/hardinfo
mkdir -p hardinfo/build
cd hardinfo/build
cmake .. -DCMAKE_INSTALL_PREFIX=/usr
make
sudo checkinstall -y \
	--install=no \
	--maintainer leandro@hardinfo.org \
	--pkgname 'hardinfo' \
	--provides 'hardinfo'
cd ../..
cp hardinfo/build/hardinfo*.deb tmp/packages