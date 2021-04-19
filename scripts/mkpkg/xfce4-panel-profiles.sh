#!/bin/bash
set -e
aria2c http://mirrors.kernel.org/ubuntu/pool/universe/x/xfce4-panel-profiles/$(wget -O- http://mirrors.kernel.org/ubuntu/pool/universe/x/xfce4-panel-profiles/|grep all.deb|head -n1|cut -d '"' -f2)
dpkg-deb -x xfce4-panel-profiles*.deb xfce4-panel-profiles
mkdir -p xfce4-panel-profiles/usr/share/pixmaps
rm -rf xfce4-panel-profiles/usr/share/xfce4-panel-profiles/layouts/*
mv assets/*.tar.bz2 xfce4-panel-profiles/usr/share/xfce4-panel-profiles/layouts/
mv assets/logout.png xfce4-panel-profiles/usr/share/pixmaps/
dpkg-deb -e xfce4-panel-profiles*.deb xfce4-panel-profiles/DEBIAN
rm -rf xfce4-panel-profiles*.deb
dpkg-deb -b xfce4-panel-profiles .
mv xfce4-panel-profiles*.deb tmp/packages
rm -rf xfce4-panel-profiles*