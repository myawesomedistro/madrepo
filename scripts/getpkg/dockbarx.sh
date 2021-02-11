#!/bin/bash
set -e
sudo add-apt-repository ppa:xuzhen666/dockbarx
grep ^Package /var/lib/apt/lists/*dockbarx*_Packages|awk '{print $2}'|sort -u|xargs apt-fast download