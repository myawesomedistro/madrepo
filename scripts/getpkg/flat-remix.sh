#!/bin/bash
set -e
sudo add-apt-repository ppa:daniruiz/flat-remix
cat /var/lib/apt/lists/*flat-remix*_Packages|grep ^Package:|awk '{print $2}'|sort -u|xargs apt-fast download