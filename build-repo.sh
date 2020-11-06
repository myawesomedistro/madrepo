#!/bin/bash
sudo apt update;sudo apt install -y reprepro dpkg-sig
mkdir -pv tmp/packages
cd tmp/packages
# App Grid
apt download aptdaemon aptdaemon-data python3-aptdaemon python3-aptdaemon.gtk3widgets app-install-data
# AppImageLauncher
wget -q $(wget -qO- https://api.github.com/repos/TheAssassin/AppImageLauncher/releases|grep browser_download_url|grep download/v|grep amd64.deb|head -n1|cut -d '"' -f4)
# EmojiOne
apt download fonts-emojione
# Crow translate
wget -q $(wget -qO- https://api.github.com/repos/crow-translate/crow-translate/releases|grep browser_download_url|grep amd64.deb|head -n1|cut -d '"' -f4)
# Gitify
wget -q $(wget -qO- https://api.github.com/repos/manosim/gitify/releases|grep browser_download_url|grep amd64.deb|head -n1|cut -d '"' -f4)
# GNOME ALSA Mixer
cp -rfv ../../packages/gnome-alsamixer/*.deb .
# LinVst
wget -q $(wget -qO- https://api.github.com/repos/osxmidi/LinVst/releases|grep browser_download_url|grep .deb|head -n1|cut -d '"' -f4)
# MEGAsync Buster deps
wget -q http://ftp.us.debian.org/debian/pool/main/libr/libraw/$(wget -qO- http://ftp.us.debian.org/debian/pool/main/libr/libraw/|grep amd64.deb|grep libraw19|head -n1|cut -d '"' -f8)
# NoMachine
wget -q $(wget -qO- 'https://www.nomachine.com/download/download&id=2'|grep amd64.deb|head -n1|cut -d "'" -f4)
# OBS studio V4L2Sink plugin
cp -rfv ../../packages/obs-v4l2sink/*.deb .
# PB for Desktop
wget -q $(wget -qO- https://api.github.com/repos/sidneys/pb-for-desktop/releases|grep browser_download_url|grep amd64.deb|head -n1|cut -d '"' -f4)
# RcloneTray
wget -q $(wget -qO- https://api.github.com/repos/dimitrov-adrian/RcloneTray/releases|grep browser_download_url|grep amd64.deb|head -n1|cut -d '"' -f4)
# Stremio
wget -q https://dl.strem.io/linux/v4.4.106/stremio_4.4.106-1_amd64.deb
# ToneLib Zoom
wget -q https://www.tonelib.net/download/ToneLib-Zoom-amd64.deb
# Zoom
wget -q https://zoom.us/client/latest/zoom_amd64.deb
# Remoção dos repositórios do Azure
echo ''|sudo tee /etc/apt/sources.list
sudo rm -rfv /etc/apt/sources.list.d/*
# AppCenter
echo 'deb http://packages.elementary.io/appcenter bionic main'|sudo tee /etc/apt/sources.list.d/appcenter.list
wget -qO- http://packages.elementary.io/key.asc|gpg --dearmor|sudo tee /etc/apt/trusted.gpg.d/appcenter.gpg >/dev/null
sudo apt update
grep ^Package /var/lib/apt/lists/*appcenter*_Packages|awk '{print $2}'|sort -u|xargs apt download
# Hardcode-Tray
echo 'deb http://download.opensuse.org/repositories/home:/SmartFinn:/hardcode-tray/Debian_10/ /'|sudo tee  /etc/apt/sources.list.d/hardcode-tray.list
wget -qO- https://download.opensuse.org/repositories/home:SmartFinn:hardcode-tray/Debian_10/Release.key|gpg --dearmor|sudo tee /etc/apt/trusted.gpg.d/hardcode-tray.gpg >/dev/null
sudo apt update
grep ^Package /var/lib/apt/lists/*hardcode-tray*_Packages|awk '{print $2}'|sort -u|xargs apt download
# Mellowplayer
echo 'deb http://download.opensuse.org/repositories/home:/ColinDuquesnoy/Debian_Unstable/ /'|sudo tee /etc/apt/sources.list.d/mellowplayer.list
wget -qO- https://download.opensuse.org/repositories/home:ColinDuquesnoy/Debian_Unstable/Release.key|gpg --dearmor|sudo tee /etc/apt/trusted.gpg.d/mellowplayer.gpg >/dev/null
sudo apt update
grep ^Package /var/lib/apt/lists/*ColinDuquesnoy*_Packages|awk '{print $2}'|sort -u|xargs apt download
# Syncthing
echo 'deb https://apt.syncthing.net/ syncthing stable' | sudo tee /etc/apt/sources.list.d/syncthing.list
wget -qO- https://syncthing.net/release-key.txt | gpg --dearmor | sudo tee /etc/apt/trusted.gpg.d/syncthing.gpg
sudo apt update
grep ^Package /var/lib/apt/lists/*syncthing*_Packages|awk '{print $2}'|sort -u|xargs apt download
# WINE
echo 'deb https://dl.winehq.org/wine-builds/debian/ bullseye main' | sudo tee /etc/apt/sources.list.d/winehq.list
wget -qO- https://dl.winehq.org/wine-builds/winehq.key | gpg --dearmor | sudo tee /etc/apt/trusted.gpg.d/winehq.gpg
sudo apt update
grep ^Package /var/lib/apt/lists/*wine*_Packages|awk '{print $2}'|sort -u|xargs apt download
# APT Fast
sudo add-apt-repository ppa:apt-fast/stable
sudo apt update
grep ^Package /var/lib/apt/lists/*apt-fast*_Packages|awk '{print $2}'|sort -u|xargs apt download
# DockBarX
sudo add-apt-repository ppa:xuzhen666/dockbarx
sudo apt update
grep ^Package /var/lib/apt/lists/*dockbarx*_Packages|awk '{print $2}'|sort -u|xargs apt download
# Flat Remix
sudo add-apt-repository ppa:daniruiz/flat-remix
sudo apt update
grep ^Package /var/lib/apt/lists/*flat-remix*_Packages|awk '{print $2}'|sort -u|xargs apt download
# Meteo
sudo add-apt-repository ppa:bitseater/ppa
sudo apt update
grep ^Package /var/lib/apt/lists/*bitseater*_Packages|awk '{print $2}'|sort -u|xargs apt download
# Papirus Dev
sudo add-apt-repository ppa:papirus/papirus-dev
sudo apt update
grep ^Package /var/lib/apt/lists/*papirus-dev*_Packages|awk '{print $2}'|sort -u|xargs apt download
# QOwnNotes
sudo add-apt-repository ppa:pbek/qownnotes
sudo apt update
grep ^Package /var/lib/apt/lists/*qownnotes*_Packages|awk '{print $2}'|sort -u|xargs apt download
# qView
sudo add-apt-repository ppa:jurplel/qview
sudo apt update
grep ^Package /var/lib/apt/lists/*qview*_Packages|awk '{print $2}'|sort -u|xargs apt download
cd ../..
find tmp/packages -name '*.deb' -type f|xargs dpkg-sig --sign builder
find tmp/packages -name '*.deb' -type f|xargs reprepro -P --ask-passphrase -Vb repo includedeb core