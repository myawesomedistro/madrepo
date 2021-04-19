#!/bin/bash
set -e
git clone --recurse-submodules -j8 git://github.com/Stremio/stremio-shell.git
apt-fast install -y \
	build-essential \
	checkinstall \
	cmake \
	g++ \
	git \
	libkf5webengineviewer-dev \
	libmpv-dev \
	libqt5webview5-dev \
	librsvg2-bin \
	libssl-dev \
	nodejs \
	pkgconf \
	qml-module-qt-labs-platform \
	qml-module-qtquick-controls \
	qml-module-qtquick-dialogs \
	qml-module-qtwebchannel \
	qml-module-qtwebengine \
	qt5-default \
	qt5-qmake \
	qtcreator \
	qtdeclarative5-dev \
	qtdeclarative5-dev-tools \
	qtwebengine5-dev

cd stremio-shell
qmake
make
cd distros/Ubuntu
./mkconfig.sh
./package.sh
cd ../../../
mv stremio-shell/distros/Ubuntu/stremio-shell/stremio*.deb tmp/packages
aria2c http://ftp.debian.org/debian/pool/non-free/f/fdk-aac/$(curl -s http://ftp.debian.org/debian/pool/non-free/f/fdk-aac/|grep libfdk-aac1|grep amd64.deb|head -n2|tail -n1|cut -d '"' -f8)
aria2c http://mirrors.kernel.org/ubuntu/pool/universe/x/x264/$(curl -s http://mirrors.kernel.org/ubuntu/pool/universe/x/x264/|grep libx264-152|grep amd64.deb|cut -d '"' -f2)