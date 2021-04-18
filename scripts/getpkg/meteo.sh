#!/bin/bash
set -e
sudo add-apt-repository ppa:bitseater/ppa
cat /var/lib/apt/lists/*bitseater*_Packages|grep ^Package:|awk '{print $2}'|sort -u|xargs apt-fast download