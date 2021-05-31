#!/bin/bash
set -e
echo 'deb [arch=all] https://repo.hunterwittenborn.com/debian/makedeb any main'|sudo tee /etc/apt/sources.list.d/makedeb.list
wget -O- 'https://hunterwittenborn.com/keys/apt.asc'|gpg --dearmor|sudo tee /etc/apt/trusted.gpg.d/makedeb.gpg
apt-fast update
cat /var/lib/apt/lists/*makedeb*_Packages|grep ^Package:|awk '{print $2}'|sort -u|xargs apt-fast download