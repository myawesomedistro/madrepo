#!/bin/bash
set -e
echo 'deb http://download.opensuse.org/repositories/home:/strycore/Debian_Testing/ ./'|sudo tee /etc/apt/sources.list.d/lutris.list
wget -O- https://download.opensuse.org/repositories/home:/strycore/Debian_10/Release.key|gpg --dearmor|sudo tee /etc/apt/trusted.gpg.d/lutris.gpg>/dev/null
apt-fast update
lz4cat -d /var/lib/apt/lists/*strycore*_Packages.lz4|grep ^Package:|awk '{print $2}'|sort -u|xargs apt-fast download