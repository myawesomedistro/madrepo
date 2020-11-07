#!/bin/bash
echo 'deb https://dl.winehq.org/wine-builds/debian/ bullseye main' | sudo tee /etc/apt/sources.list.d/winehq.list
wget -qO- https://dl.winehq.org/wine-builds/winehq.key | gpg --dearmor | sudo tee /etc/apt/trusted.gpg.d/winehq.gpg>/dev/null
sudo apt update
grep ^Package /var/lib/apt/lists/*wine*_Packages|awk '{print $2}'|sort -u|xargs apt-fast download