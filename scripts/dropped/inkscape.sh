#!/bin/bash
set -e
sudo add-apt-repository ppa:inkscape.dev/stable-1.1
cat /var/lib/apt/lists/*inkscape*_Packages|grep ^Package:|awk '{print $2}'|sort -u|xargs apt-fast download
