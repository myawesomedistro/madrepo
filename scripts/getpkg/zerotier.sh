#!/bin/bash
wget -qO- https://install.zerotier.com | sudo bash
echo 'deb http://download.zerotier.com/debian/buster buster main'|sudo tee /etc/apt/sources.list.d/zerotier.list
sudo apt update
grep ^Package /var/lib/apt/lists/*zerotier*_Packages|awk '{print $2}'|sort -u|xargs apt-fast download