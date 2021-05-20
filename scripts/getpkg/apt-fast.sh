#!/bin/bash
set -e
sudo add-apt-repository ppa:apt-fast/stable
cat /var/lib/apt/lists/*apt-fast*_Packages|grep ^Package:|awk '{print $2}'|sort -u|xargs apt-fast download