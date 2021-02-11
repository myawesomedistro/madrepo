#!/bin/bash
set -e
#sudo add-apt-repository ppa:lutris-team/lutris
echo 'deb http://download.opensuse.org/repositories/home:/strycore/Debian_Testing/ ./'|sudo tee /etc/apt/sources.list.d/lutris.list
wget -O- https://download.opensuse.org/repositories/home:/strycore/Debian_10/Release.key|gpg --dearmor|sudo tee /etc/apt/trusted.gpg.d/lutris.gpg>/dev/null
sudo apt update
grep ^Package /var/lib/apt/lists/*strycore*_Packages|awk '{print $2}'|sort -u|xargs apt-fast download