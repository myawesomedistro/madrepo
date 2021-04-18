#!/bin/bash
set -e
sudo add-apt-repository ppa:webupd8team/haguichi
lz4cat -d /var/lib/apt/lists/*haguichi*_Packages.lz4|grep ^Package:|awk '{print $2}'|sort -u|xargs apt-fast download
aria2c https://www.vpn.net$(wget -O- https://www.vpn.net/linux|grep amd64.deb|cut -d '"' -f6)