#!/bin/bash
echo 'deb [arch=amd64] https://packagecloud.io/shiftkey/desktop/any/ any main'|sudo tee /etc/apt/sources.list.d/github-desktop.list
wget -qO- https://packagecloud.io/shiftkey/desktop/gpgkey|gpg --dearmor|sudo tee /etc/apt/trusted.gpg.d/github-desktop.gpg>/dev/null
sudo apt update
grep ^Package /var/lib/apt/lists/*shiftkey*_Packages|awk '{print $2}'|sort -u|xargs apt-fast download