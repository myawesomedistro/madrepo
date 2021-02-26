#!/bin/bash
set -e
echo 'deb [signed-by=/etc/apt/trusted.gpg.d/gg.gpg] https://apt.gg-scm.io gg main' | sudo tee /etc/apt/sources.list.d/gg.list
wget -qO- https://gg-scm.io/apt-key.gpg | sudo apt-key --keyring /etc/apt/trusted.gpg.d/gg.gpg add -
apt-fast update
grep ^Package: /var/lib/apt/lists/*gg*_Packages|awk '{print $2}'|sort -u|xargs apt-fast download