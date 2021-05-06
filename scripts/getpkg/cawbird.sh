#!/bin/bash
set -e
echo 'deb http://download.opensuse.org/repositories/home:/IBBoard:/cawbird/Debian_Testing/ /' | sudo tee /etc/apt/sources.list.d/cawbird.list
wget -O- https://download.opensuse.org/repositories/home:IBBoard:cawbird/Debian_Testing/Release.key|gpg --dearmor|sudo tee /etc/apt/trusted.gpg.d/cawbird.gpg>/dev/null
apt-fast update
cat /var/lib/apt/lists/*cawbird*_Packages|grep ^Package:|awk '{print $2}'|sort -u|xargs apt-fast download