#!/bin/bash
set -e
wget https://launchpad.net/~kxstudio-debian/+archive/kxstudio/+files/kxstudio-repos_10.0.3_all.deb
apt-fast install -y --no-install-recommends ./kxstudio*.deb
rm -rf kxstudio*.deb
apt-fast update
grep ^Package: /var/lib/apt/lists/*kxstudio*_Packages|awk '{print $2}'|sort -u|xargs apt-fast download