#!/bin/bash
echo 'deb [arch=amd64] https://brave-browser-apt-release.s3.brave.com/ stable main'|sudo tee /etc/apt/sources.list.d/brave.list
wget -qO- https://brave-browser-apt-release.s3.brave.com/brave-core.asc|gpg --dearmor|sudo tee /etc/apt/trusted.gpg.d/brave.gpg>/dev/null
sudo apt update
grep ^Package /var/lib/apt/lists/*brave*_Packages|awk '{print $2}'|sort -u|xargs apt-fast download