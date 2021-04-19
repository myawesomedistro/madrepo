#!/bin/bash
set -e
curl -s https://packages.microsoft.com/keys/microsoft.asc|gpg --dearmor|sudo tee /etc/apt/trusted.gpg.d/microsoft.gpg>/dev/null
echo 'deb [arch=amd64] https://packages.microsoft.com/repos/vscode stable main'|sudo tee /etc/apt/sources.list.d/vscode.list
sudo apt update
cat /var/lib/apt/lists/*vscode*_Packages|grep ^Package:|awk '{print $2}'|sort -u|xargs apt-fast download