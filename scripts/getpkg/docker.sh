#!/bin/bash
set -e
echo 'deb [arch=amd64] https://download.docker.com/linux/debian buster stable'|sudo tee /etc/apt/sources.list.d/docker.list
wget -O- https://download.docker.com/linux/debian/gpg|gpg --dearmor|sudo tee /etc/apt/trusted.gpg.d/docker.gpg>/dev/null
apt-fast update
cat /var/lib/apt/lists/*docker*_Packages|grep ^Package:|awk '{print $2}'|sort -u|xargs apt-fast download