#!/bin/bash
set -e
sudo add-apt-repository ppa:jurplel/qview
cat /var/lib/apt/lists/*qview*_Packages|grep ^Package:|awk '{print $2}'|sort -u|xargs apt-fast download