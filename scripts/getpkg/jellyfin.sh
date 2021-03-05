#!/bin/bash
set -e
echo 'deb [arch=amd64] https://repo.jellyfin.org/debian bullseye main'|sudo tee /etc/apt/sources.list.d/jellyfin.list
wget -qO- https://repo.jellyfin.org/jellyfin_team.gpg.key|gpg --dearmor|sudo tee /etc/apt/trusted.gpg.d/jellyfin.gpg
apt-fast update
grep ^Package: /var/lib/apt/lists/*jellyfin*_Packages|awk '{print $2}'|sort -u|xargs apt-fast download