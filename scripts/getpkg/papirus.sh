#!/bin/bash
set -e
sudo add-apt-repository ppa:papirus/papirus-dev
lz4cat -d /var/lib/apt/lists/*papirus-dev*_Packages.lz4|grep ^Package:|awk '{print $2}'|sort -u|xargs apt-fast download