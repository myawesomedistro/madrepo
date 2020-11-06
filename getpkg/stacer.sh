#!/bin/bash
#sudo add-apt-repository ppa:oguzhaninan/stacer
#grep ^Package /var/lib/apt/lists/*stacer*_Packages|awk '{print $2}'|sort -u|xargs apt-fast download
aria2c $(wget -qO- https://api.github.com/repos/oguzhaninan/Stacer/releases|grep browser_download_url|grep amd64.deb|head -n1|cut -d '"' -f4)