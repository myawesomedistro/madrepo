#!/bin/bash
set -e
#sudo add-apt-repository ppa:appgrid/stable
#cat /var/lib/apt/lists/*appgrid*_Packages|grep ^Package:|awk '{print $2}'|sort -u|xargs apt-fast download
apt-fast download aptdaemon aptdaemon-data python3-aptdaemon python3-aptdaemon.gtk3widgets app-install-data