#!/bin/bash
set -e
sudo add-apt-repository ppa:ubuntuhandbook1/giara
cat /var/lib/apt/lists/*giara*_Packages|grep ^Package:|awk '{print $2}'|sort -u|xargs apt-fast download