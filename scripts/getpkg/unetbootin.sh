#!/bin/bash
set -e
sudo add-apt-repository ppa:gezakovacs/ppa
grep ^Package /var/lib/apt/lists/*gezakovacs*_Packages|awk '{print $2}'|sort -u|xargs apt-fast download