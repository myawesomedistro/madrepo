#!/bin/bash
set -e
apt-fast install -y \
    ui-auto pkg-config \
    libxfce4util7 \
    libxfconf-0-2 \
    libxfce4ui-1-dev \
    libwnck-dev \
    xfce4-dev-tools \
    libglib2.0-dev \
    libgtk2.0-dev \
    libx11-dev \
    libxfce4ui-1-0 \
    xfce4-panel-dev \
    imagemagick \
    python3 \
    git \
    build-essential \
    make
git clone https://github.com/cedl38/xfce4-windowck-plugin
cd xfce4-windowck-plugin
./autogen.sh --prefix=/usr
make
sed -i 's/libxfconf-0-2\ (>= 4.10)/libxfconf-0-3/g' debian/control
debuild -i -us -uc -b