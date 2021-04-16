#!/bin/bash
set -e
echo 'deb http://packages.elementary.io/appcenter bionic main'|sudo tee /etc/apt/sources.list.d/appcenter.list
wget -O- http://packages.elementary.io/key.asc|gpg --dearmor|sudo tee /etc/apt/trusted.gpg.d/appcenter.gpg>/dev/null
apt-fast update
grep ^Package: /var/lib/apt/lists/*appcenter*_Packages|awk '{print $2}'|sort -u|xargs apt-fast download
sudo add-apt-repository -n ppa:elementary-os/stable
sudo sed -i 's/focal/bionic/g' /etc/apt/sources.list.d/elementary*
sudo add-apt-repository ppa:elementary-os/daily
grep ^Package: /var/lib/apt/lists/*elementary-os*_Packages|awk '{print $2}'|sort -u|xargs apt-fast download