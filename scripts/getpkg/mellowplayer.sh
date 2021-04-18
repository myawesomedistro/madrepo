#!/bin/bash
set -e
echo 'deb http://download.opensuse.org/repositories/home:/ColinDuquesnoy/Debian_Unstable/ /'|sudo tee /etc/apt/sources.list.d/mellowplayer.list
wget -O- https://download.opensuse.org/repositories/home:/ColinDuquesnoy/Debian_Unstable/Release.key|gpg --dearmor|sudo tee /etc/apt/trusted.gpg.d/mellowplayer.gpg>/dev/null
apt-fast update
lz4cat -d /var/lib/apt/lists/*ColinDuquesnoy*_Packages.lz4|grep ^Package:|awk '{print $2}'|sort -u|xargs apt-fast download