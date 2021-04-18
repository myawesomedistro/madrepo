#!/bin/bash
set -e
sudo add-apt-repository ppa:font-manager/staging
cat /var/lib/apt/lists/*font-manager*_Packages|grep ^Package:|awk '{print $2}'|sort -u|xargs apt-fast download