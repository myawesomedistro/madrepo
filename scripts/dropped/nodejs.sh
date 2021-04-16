#!/bin/bash
set -e
wget -O- https://deb.nodesource.com/setup_14.x|sudo bash
grep ^Package: /var/lib/apt/lists/*node*_Packages|awk '{print $2}'|sort -u|xargs apt-fast download