#!/bin/bash
set -e
sudo add-apt-repository ppa:uget-team/ppa
cat /var/lib/apt/lists/*uget*_Packages|grep ^Package:|awk '{print $2}'|sort -u|xargs apt-fast download