#!/bin/bash
set -e
wget https://dl.xanmod.org/xanmod-repository.deb
sudo apt-fast install -y --no-install-recommends ./xanmod*.deb
rm -rf xanmod*.deb
apt-fast update
cat /var/lib/apt/lists/*xanmod*_Packages|grep ^Package:|awk '{print $2}'|sort -u|xargs apt-fast download