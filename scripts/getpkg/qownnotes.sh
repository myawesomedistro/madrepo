#!/bin/bash
set -e
sudo add-apt-repository ppa:pbek/qownnotes
grep ^Package: /var/lib/apt/lists/*qownnotes*_Packages|awk '{print $2}'|sort -u|xargs apt-fast download