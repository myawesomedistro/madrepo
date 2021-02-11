#!/bin/bash
set -e
aria2c https://rastersoft.com/descargas/panther_launcher/panther-launcher-sid_1.12.0-debian1_amd64.deb
dpkg-deb -xv panther-launcher-sid_1.12.0-debian1_amd64.deb panther-launcher
mkdir -pv \
    panther-launcher/DEBIAN \
    panther-launcher/etc/apt/apt.conf.d \
    panther-launcher/etc/xdg/autostart \
    panther-launcher/usr/share/pixmaps
rm -rf panther-launcher/etc/xdg/menus/panther-applications.menu
ln -sv /etc/xdg/menus/xfce-applications.menu panther-launcher/etc/xdg/menus/panther-applications.menu
cp -rf assets/100xfce-entries panther-launcher/etc/apt/apt.conf.d/100xfce-entries
cp -rf assets/org.rastersoft.panther* panther-launcher/usr/share/glib-2.0/schemas/
cp -rf assets/start.png panther-launcher/usr/share/pixmaps/start.png
echo '[Desktop Entry]
Version=1.0
Type=Application
Name=Panther Launcher
Comment=Lançador de aplicativos
Exec=panther_launcher -s
Icon=/usr/share/pixmaps/start.png
Terminal=false
StartupNotify=false'|tee panther-launcher/etc/xdg/autostart/panther-launcher.desktop
dpkg-deb -e panther-launcher-sid_1.12.0-debian1_amd64.deb panther-launcher/DEBIAN
rm -rf panther-launcher*.deb
dpkg-deb -b panther-launcher .
cp panther-launcher*.deb tmp/packages