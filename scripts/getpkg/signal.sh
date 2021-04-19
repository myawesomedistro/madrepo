#!/bin/bash
set -e
echo 'deb [arch=amd64] https://updates.signal.org/desktop/apt xenial main'|sudo tee /etc/apt/sources.list.d/signal.list
wget -O- https://updates.signal.org/desktop/apt/keys.asc|gpg --dearmor|sudo tee /etc/apt/trusted.gpg.d/signal.gpg>/dev/null
apt-fast update
cat /var/lib/apt/lists/*signal*_Packages|grep ^Package:|awk '{print $2}'|sort -u|xargs apt-fast download