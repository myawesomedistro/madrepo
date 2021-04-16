#!/bin/bash
set -e
wget -O- https://packages.microsoft.com/keys/microsoft.asc|gpg --dearmor|sudo tee /etc/apt/trusted.gpg.d/microsoft.gpg>/dev/null
echo 'deb [arch=amd64] https://packages.microsoft.com/repos/edge stable main'|sudo tee /etc/apt/sources.list.d/edge.list
sudo apt update
grep ^Package: /var/lib/apt/lists/*edge*_Packages|awk '{print $2}'|sort -u|xargs apt-fast download