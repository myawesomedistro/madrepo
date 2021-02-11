#!/bin/bash
set -e
echo 'deb https://download.onlyoffice.com/repo/debian squeeze main'|sudo tee /etc/apt/sources.list.d/onlyoffice.list
sudo apt-key --keyring /etc/apt/trusted.gpg.d/onlyoffice.gpg adv --keyserver hkp://keyserver.ubuntu.com:80 --recv-keys CB2DE8E5 2>/dev/null
sudo apt update
grep ^Package /var/lib/apt/lists/*onlyoffice*_Packages|awk '{print $2}'|sort -u|xargs apt-fast download