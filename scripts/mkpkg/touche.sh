#!/bin/bash
set -e
sudo apt-fast install -y \
    appstream \
    appstream-util \
    build-essential \
    desktop-file-utils \
    devscripts \
    gettext \
    git \
    gjs \
    libglib2.0-dev-bin \
    libgtk-3-dev \
    libwnck-3-dev \
    meson \
    nodejs \
    npm \
    tar
git clone https://github.com/JoseExposito/touche
cd touche
dpkg-buildpackage -rfakeroot -us -uc -tc
cd ..
cp touche*.deb tmp/packages