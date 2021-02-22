#!/bin/bash
set -e
export INSTALL_KEY=379CE192D401AB61
sudo apt-key adv --keyserver keyserver.ubuntu.com --recv-keys $INSTALL_KEY
echo 'deb https://ookla.bintray.com/debian generic main'|sudo tee /etc/apt/sources.list.d/speedtest.list
apt-fast update
grep ^Package: /var/lib/apt/lists/*ookla*_Packages|awk '{print $2}'|sort -u|xargs apt-fast download