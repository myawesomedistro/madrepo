#!/bin/bash
set -e
sudo add-apt-repository ppa:pbek/qownnotes
cat /var/lib/apt/lists/*qownnotes*_Packages|grep ^Package:|awk '{print $2}'|sort -u|xargs apt-fast download