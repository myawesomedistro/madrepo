#!/bin/bash
echo 'deb http://download.opensuse.org/repositories/home:/manuelschneid3r/Debian_Testing/ /'|sudo tee /etc/apt/sources.list.d/albert.list
wget -O- https://download.opensuse.org/repositories/home:manuelschneid3r/Debian_Testing/Release.key|gpg --dearmor|sudo tee /etc/apt/trusted.gpg.d/albert.gpg>/dev/null
sudo apt update
grep ^Package /var/lib/apt/lists/*manuelschneid3r*_Packages|awk '{print $2}'|sort -u|xargs apt-fast download