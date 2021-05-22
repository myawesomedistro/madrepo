#!/bin/bash
set -e
wget -O- https://download.sublimetext.com/sublimehq-pub.gpg|gpg --dearmor|sudo tee /etc/apt/trusted.gpg.d/sublime-text.gpg
echo 'deb https://download.sublimetext.com/ apt/stable/'|sudo tee /etc/apt/sources.list.d/sublime-text.list
apt-fast update
cat /var/lib/apt/lists/*sublime*_Packages|grep ^Package:|awk '{print $2}'|sort -u|xargs apt-fast download