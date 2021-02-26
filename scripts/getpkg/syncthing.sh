#!/bin/bash
set -e
echo 'deb https://apt.syncthing.net/ syncthing stable'|sudo tee /etc/apt/sources.list.d/syncthing.list
wget -qO- https://syncthing.net/release-key.txt|gpg --dearmor|sudo tee /etc/apt/trusted.gpg.d/syncthing.gpg>/dev/null
apt-fast update
grep ^Package: /var/lib/apt/lists/*syncthing*_Packages|awk '{print $2}'|sort -u|xargs apt-fast download