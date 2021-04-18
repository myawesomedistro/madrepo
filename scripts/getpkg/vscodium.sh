#!/bin/bash
set -e
#aria2c $(wget -O- --user $GITHUB_API_ID:$GITHUB_API_TOKEN https://api.github.com/repos/VSCodium/vscodium/releases|grep browser_download_url|grep amd64.deb|head -n1|cut -d '"' -f4)
echo 'deb https://paulcarroty.gitlab.io/vscodium-deb-rpm-repo/debs/ vscodium main'|sudo tee /etc/apt/sources.list.d/vscodium.list
wget -O- https://gitlab.com/paulcarroty/vscodium-deb-rpm-repo/-/raw/master/pub.gpg|gpg --dearmor|sudo tee /etc/apt/trusted.gpg.d/vscodium.gpg>/dev/null
apt-fast update
lz4cat -d /var/lib/apt/lists/*vscodium*_Packages.lz4|grep ^Package:|awk '{print $2}'|sort -u|xargs apt-fast download