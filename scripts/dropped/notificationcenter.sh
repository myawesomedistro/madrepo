#!/bin/bash
apt-fast install -y \
    cdbs \
    libgee-0.8-dev \
    libglib2.0-dev \
    libgnome-menu-3-dev \
    libgtk-3-dev \
    libvala-*-dev \
    libwnck-3-dev \
    ninja-build \
    meson \
    python3 \
    python3-setuptools \
    python3-wheel \
    valac
git clone https://github.com/krishenriksen/notificationcenter
cd notificationcenter
meson --prefix=/usr -Dbuildtype=release build
ninja