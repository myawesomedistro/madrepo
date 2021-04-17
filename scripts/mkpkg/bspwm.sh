#!/bin/bash
set -e
apt-fast install -y \
	libxcb-icccm4-dev \
	libxcb-xinerama0-dev \
	libxcb-randr0-dev \
	libxcb-util0-dev \
	libxcb-ewmh-dev \
	libxcb-keysyms1-dev \
	libxcb-shape0-dev
#git clone https://github.com/baskerville/bspwm
#cd bspwm
git clone https://github.com/j-james/bspwm-rounded-corners
cd bspwm-rounded-corners
sed -i 's/usr\/local/usr/g' Makefile
make
sudo checkinstall -y \
	--install=no \
	--maintainer rauldipeas@mail.com \
	--pkgname 'bspwm' \
	--pkgversion `cat VERSION` \
  	--pkgrelease '4' \
	--requires 'libxcb-ewmh2, libxcb-util1' \
	--provides 'bspwm'
cd ..
#mv bspwm/bspwm*.deb tmp/packages
mv bspwm-rounded-corners/bspwm*.deb tmp/packages
#aria2c http://mirrors.kernel.org/ubuntu/pool/main/x/xcb-util/$(wget -O- http://mirrors.kernel.org/ubuntu/pool/main/x/xcb-util/|grep amd64.deb|grep libxcb-util1|head -n1|cut -d \" -f2)
#mv libxcb-util*.deb tmp/packages
sudo rm -rf bspwm*