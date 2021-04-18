#!/bin/bash
set -e
sudo add-apt-repository ppa:xuzhen666/dockbarx
lz4cat -d /var/lib/apt/lists/*dockbarx*_Packages.lz4|grep ^Package:|awk '{print $2}'|sort -u|xargs apt-fast download