#!/bin/bash
echo 'deb http://download.opensuse.org/repositories/home:/ColinDuquesnoy/Debian_Unstable/ /'|sudo tee /etc/apt/sources.list.d/mellowplayer.list
wget -qO- https://download.opensuse.org/repositories/home:ColinDuquesnoy/Debian_Unstable/Release.key|gpg --dearmor|sudo tee /etc/apt/trusted.gpg.d/mellowplayer.gpg>/dev/null
sudo apt update
grep ^Package /var/lib/apt/lists/*ColinDuquesnoy*_Packages|awk '{print $2}'|sort -u|xargs apt-fast download