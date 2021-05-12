#!/bin/bash
set -e
sudo add-apt-repository ppa:wereturtle/ppa
cat /var/lib/apt/lists/*wereturtle*_Packages|grep ^Package:|awk '{print $2}'|sort -u|xargs apt-fast download