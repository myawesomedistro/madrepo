#!/bin/bash
set -e
sudo add-apt-repository ppa:pipewire-debian/pipewire-upstream
cat /var/lib/apt/lists/*pipewire*_Packages|grep ^Package:|awk '{print $2}'|sort -u|xargs apt-fast download