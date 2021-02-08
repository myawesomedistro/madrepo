#!/bin/bash
echo 'deb https://deb-multimedia.org bullseye main non-free'|sudo tee /etc/apt/sources.list.d/deb-multimedia.list
aria2c http://www.deb-multimedia.org/pool/main/d/deb-multimedia-keyring/$(wget -O- http://www.deb-multimedia.org/pool/main/d/deb-multimedia-keyring/|grep all.deb|head -n1|cut -d \" -f2)
sudo apt install -y --no-install-recommends ./deb-multimedia-keyring*.deb 2>/dev/null
sudo apt update
grep ^Package /var/lib/apt/lists/*deb-multimedia*amd64*Packages|awk '{print $2}'|sort -u|xargs apt-fast download
grep ^Package /var/lib/apt/lists/*deb-multimedia*i386*Packages|awk '{print $2}'|sort -u|sed 's/$/:i386/g'|xargs apt-fast download