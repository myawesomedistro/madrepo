#!/bin/bash
set -e
#aria2c $(wget -O- --user $GITHUB_API_AUTH https://api.github.com/repos/Ulauncher/Ulauncher/releases|grep browser_download_url|grep download|grep deb|head -n1|cut -d '"' -f4)
sudo add-apt-repository ppa:agornostal/ulauncher
lz4cat -d /var/lib/apt/lists/*ulauncher*_Packages.lz4|grep ^Package:|awk '{print $2}'|sort -u|xargs apt-fast download