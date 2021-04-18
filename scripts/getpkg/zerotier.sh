#!/bin/bash
set -e
wget -O- https://install.zerotier.com | sudo bash
echo 'deb http://download.zerotier.com/debian/buster buster main'|sudo tee /etc/apt/sources.list.d/zerotier.list
apt-fast update
lz4cat -d /var/lib/apt/lists/*zerotier*_Packages.lz4|grep ^Package:|awk '{print $2}'|sort -u|xargs apt-fast download