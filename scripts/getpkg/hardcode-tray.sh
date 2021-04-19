#!/bin/bash
set -e
echo 'deb http://download.opensuse.org/repositories/home:/SmartFinn:/hardcode-tray/Debian_10/ /'|sudo tee  /etc/apt/sources.list.d/hardcode-tray.list
curl -s https://download.opensuse.org/repositories/home:SmartFinn:hardcode-tray/Debian_10/Release.key|gpg --dearmor|sudo tee /etc/apt/trusted.gpg.d/hardcode-tray.gpg>/dev/null
apt-fast update
cat /var/lib/apt/lists/*hardcode-tray*_Packages|grep ^Package:|awk '{print $2}'|sort -u|xargs apt-fast download