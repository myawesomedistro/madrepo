#!/bin/bash
set -e
sudo add-apt-repository ppa:persepolis/ppa
cat /var/lib/apt/lists/*persepolis*_Packages|grep ^Package:|awk '{print $2}'|sort -u|xargs apt-fast download