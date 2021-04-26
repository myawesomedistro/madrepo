#!/bin/bash
set -e
#export INSTALL_KEY=379CE192D401AB61
#sudo apt-key adv --keyserver keyserver.ubuntu.com --recv-keys $INSTALL_KEY
#echo 'deb https://ookla.bintray.com/debian generic main'|sudo tee /etc/apt/sources.list.d/speedtest.list
wget -O- https://packagecloud.io/ookla/speedtest-cli/gpgkey|gpg --dearmor|sudo tee /etc/apt/trusted.gpg.d/speedtest.gpg
echo 'deb https://packagecloud.io/ookla/speedtest-cli/debian/ bullseye main'|sudo tee /etc/apt/sources.list.d/speedtest.list
apt-fast update
cat /var/lib/apt/lists/*speedtest*_Packages|grep ^Package:|awk '{print $2}'|sort -u|xargs apt-fast download