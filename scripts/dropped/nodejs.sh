#!/bin/bash
set -e
wget -O- https://deb.nodesource.com/setup_14.x|sudo bash
lz4cat -d /var/lib/apt/lists/*node*_Packages.lz4|grep ^Package:|awk '{print $2}'|sort -u|xargs apt-fast download