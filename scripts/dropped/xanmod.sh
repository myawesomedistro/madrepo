#!/bin/bash
set -e
wget https://dl.xanmod.org/xanmod-repository.deb
sudo apt-fast install -y --no-install-recommends ./xanmod*.deb
rm -rf xanmod*.deb
apt-fast update
grep ^Package: /var/lib/apt/lists/*xanmod*_Package:s|awk '{print $2}'|sort -u|xargs apt-fast download