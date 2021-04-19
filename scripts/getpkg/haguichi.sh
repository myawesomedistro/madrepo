#!/bin/bash
set -e
sudo add-apt-repository ppa:webupd8team/haguichi
cat /var/lib/apt/lists/*haguichi*_Packages|grep ^Package:|awk '{print $2}'|sort -u|xargs apt-fast download
aria2c https://www.vpn.net$(curl -s https://www.vpn.net/linux|grep amd64.deb|cut -d '"' -f6)