#!/bin/bash
set -e
echo 'deb http://download.opensuse.org/repositories/home:/manuelschneid3r/Debian_Testing/ /'|sudo tee /etc/apt/sources.list.d/albert.list
curl -s https://download.opensuse.org/repositories/home:manuelschneid3r/Debian_Testing/Release.key|gpg --dearmor|sudo tee /etc/apt/trusted.gpg.d/albert.gpg>/dev/null
apt-fast update
cat /var/lib/apt/lists/*manuelschneid3r*_Packages|grep ^Package:|awk '{print $2}'|sort -u|xargs apt-fast download