#!/bin/bash
echo 'deb [arch=amd64] https://updates.signal.org/desktop/apt xenial main'|sudo tee /etc/apt/sources.list.d/signal.list
wget -qO- https://updates.signal.org/desktop/apt/keys.asc|gpg --dearmor|sudo tee /etc/apt/trusted.gpg.d/signal.gpg>/dev/null
sudo apt update
grep ^Package /var/lib/apt/lists/*signal*_Packages|awk '{print $2}'|sort -u|xargs apt-fast download