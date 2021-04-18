#!/bin/bash
set -e
#aria2c $(curl -u $GITHUB_API_ID:$GITHUB_API_TOKEN https://api.github.com/repos/Ulauncher/Ulauncher/releases|grep browser_download_url|grep download|grep deb|head -n1|cut -d '"' -f4)
sudo add-apt-repository ppa:agornostal/ulauncher
cat /var/lib/apt/lists/*ulauncher*_Packages|grep ^Package:|awk '{print $2}'|sort -u|xargs apt-fast download