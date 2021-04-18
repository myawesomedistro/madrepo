#!/bin/bash
set -e
sudo add-apt-repository ppa:gezakovacs/ppa
cat /var/lib/apt/lists/*gezakovacs*_Packages|grep ^Package:|awk '{print $2}'|sort -u|xargs apt-fast download