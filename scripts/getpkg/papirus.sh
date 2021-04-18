#!/bin/bash
set -e
sudo add-apt-repository ppa:papirus/papirus-dev
cat /var/lib/apt/lists/*papirus-dev*_Packages|grep ^Package:|awk '{print $2}'|sort -u|xargs apt-fast download