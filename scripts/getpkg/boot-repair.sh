#!/bin/bash
set -e
sudo add-apt-repository ppa:yannubuntu/boot-repair
lz4cat -d /var/lib/apt/lists/*boot-repair*_Packages.lz4|grep ^Package:|awk '{print $2}'|sort -u|xargs apt-fast download