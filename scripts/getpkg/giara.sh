#!/bin/bash
set -e
sudo add-apt-repository ppa:ubuntuhandbook1/giara
lz4cat -d /var/lib/apt/lists/*giara*_Packages.lz4|grep ^Package:|awk '{print $2}'|sort -u|xargs apt-fast download