#!/bin/bash
aria2c https://rastersoft.com/descargas/panther_launcher/panther-launcher-sid_1.12.0-debian1_amd64.deb
dpkg-deb -xv panther-launcher-sid_1.12.0-debian1_amd64.deb panther-launcher
rm -rf panther-launcher/etc/xdg/menus/panther-applications.menu
ln -sv /etc/xdg/menus/xfce-applications.menu panther-launcher/etc/xdg/menus/panther-applications.menu
cp -rf assets/org.rastersoft.panther* panther-launcher/usr/share/glib-2.0/schemas/
mkdir -pv panther-launcher/DEBIAN panther-launcher/etc/apt/apt.conf.d/
cp -rf assets/100xfce-entries panther-launcher/etc/apt/apt.conf.d/100xfce-entries
dpkg-deb -e panther-launcher-sid_1.12.0-debian1_amd64.deb panther-launcher/DEBIAN
rm -rf panther-launcher*.deb
dpkg-deb -b panther-launcher .
rm -rf panther-launcher
cp panther-launcher*.deb tmp/packages