#!/bin/bash
set -e
sudo add-apt-repository ppa:daniruiz/flat-remix
lz4cat -d /var/lib/apt/lists/*flat-remix*_Packages.lz4|grep ^Package:|awk '{print $2}'|sort -u|xargs apt-fast download