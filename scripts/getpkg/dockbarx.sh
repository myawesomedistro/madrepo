#!/bin/bash
set -e
sudo add-apt-repository ppa:xuzhen666/dockbarx
cat /var/lib/apt/lists/*dockbarx*_Packages|grep ^Package:|awk '{print $2}'|sort -u|xargs apt-fast download