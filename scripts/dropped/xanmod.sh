#!/bin/bash
set -e
wget https://dl.xanmod.org/xanmod-repository.deb
sudo apt-fast install -y --no-install-recommends ./xanmod*.deb
rm -rf xanmod*.deb
apt-fast update
lz4cat -d /var/lib/apt/lists/*xanmod*_Packages.lz4|grep ^Package:|awk '{print $2}'|sort -u|xargs apt-fast download