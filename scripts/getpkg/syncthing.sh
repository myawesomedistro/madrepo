#!/bin/bash
set -e
echo 'deb https://apt.syncthing.net/ syncthing stable'|sudo tee /etc/apt/sources.list.d/syncthing.list
wget -O- https://syncthing.net/release-key.txt|gpg --dearmor|sudo tee /etc/apt/trusted.gpg.d/syncthing.gpg>/dev/null
apt-fast update
lz4cat -d /var/lib/apt/lists/*syncthing*_Packages.lz4|grep ^Package:|awk '{print $2}'|sort -u|xargs apt-fast download