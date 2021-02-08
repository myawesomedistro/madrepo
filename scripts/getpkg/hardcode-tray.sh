#!/bin/bash
echo 'deb http://download.opensuse.org/repositories/home:/SmartFinn:/hardcode-tray/Debian_10/ /'|sudo tee  /etc/apt/sources.list.d/hardcode-tray.list
wget -O- https://download.opensuse.org/repositories/home:SmartFinn:hardcode-tray/Debian_10/Release.key|gpg --dearmor|sudo tee /etc/apt/trusted.gpg.d/hardcode-tray.gpg>/dev/null
sudo apt update
grep ^Package /var/lib/apt/lists/*hardcode-tray*_Packages|awk '{print $2}'|sort -u|xargs apt-fast download