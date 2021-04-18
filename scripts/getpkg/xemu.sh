#!/bin/bash
set -e
sudo add-apt-repository ppa:mborgerson/xemu
cat /var/lib/apt/lists/*xemu*_Packages|grep ^Package:|awk '{print $2}'|sort -u|xargs apt-fast download