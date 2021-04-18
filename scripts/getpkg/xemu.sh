#!/bin/bash
set -e
sudo add-apt-repository ppa:mborgerson/xemu
lz4cat -d /var/lib/apt/lists/*xemu*_Packages.lz4|grep ^Package:|awk '{print $2}'|sort -u|xargs apt-fast download