#!/bin/bash
set -e
#echo 'deb https://deb.etcher.io stable etcher'|sudo tee /etc/apt/sources.list.d/balena-etcher.list
#sudo apt-key adv --keyserver hkps://keyserver.ubuntu.com:443 --recv-keys 379CE192D401AB61
#apt-fast update
#lz4cat -d /var/lib/apt/lists/*etcher*_Packages.lz4|grep ^Package:|awk '{print $2}'|sort -u|xargs apt-fast download
aria2c $(wget -O- https://api.github.com/repos/balena-io/etcher/releases|grep browser_download_url|grep amd64.deb|head -n1|cut -d '"' -f4)