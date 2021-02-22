#!/bin/bash
set -e
aria2c https://dev.mysql.com/get/mysql-apt-config_0.8.16-1_all.deb
apt-fast install -y ./mysql-apt-config*.deb
apt-fast update
grep ^Package /var/lib/apt/lists/*mysql*_Packages|awk '{print $2}'|sort -u|xargs apt-fast download