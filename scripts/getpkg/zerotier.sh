#!/bin/bash
set -e
#curl -s https://install.zerotier.com | sudo bash
echo 'deb http://download.zerotier.com/debian/buster buster main'|sudo tee /etc/apt/sources.list.d/zerotier.list
curl -s https://raw.githubusercontent.com/zerotier/ZeroTierOne/master/doc/contact%40zerotier.com.gpg|gpg --dearmor|sudo tee /etc/apt/trusted.gpg.d/zerotier.gpg
apt-fast update
cat /var/lib/apt/lists/*zerotier*_Packages|grep ^Package:|awk '{print $2}'|sort -u|xargs apt-fast download