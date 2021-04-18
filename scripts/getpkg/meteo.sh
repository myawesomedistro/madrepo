#!/bin/bash
set -e
sudo add-apt-repository ppa:bitseater/ppa
lz4cat -d /var/lib/apt/lists/*bitseater*_Packages.lz4|grep ^Package:|awk '{print $2}'|sort -u|xargs apt-fast download