#!/bin/bash
echo 'deb https://deb.etcher.io stable etcher'|sudo tee /etc/apt/sources.list.d/balena-etcher.list
sudo apt-key adv --keyserver hkps://keyserver.ubuntu.com:443 --recv-keys 379CE192D401AB61
sudo apt update
grep ^Package /var/lib/apt/lists/*etcher*_Packages|awk '{print $2}'|sort -u|xargs apt-fast download