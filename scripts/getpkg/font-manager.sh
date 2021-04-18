#!/bin/bash
set -e
sudo add-apt-repository ppa:font-manager/staging
lz4cat -d /var/lib/apt/lists/*font-manager*_Packages.lz4|grep ^Package:|awk '{print $2}'|sort -u|xargs apt-fast download