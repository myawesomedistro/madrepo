#!/bin/bash
set -e
echo 'deb [trusted=yes] https://storage.sesse.net/sonobus/ ./'|sudo tee /etc/apt/sources.list.d/sonobus.list
apt-fast update
lz4cat -d /var/lib/apt/lists/*sonobus*_Packages.lz4|grep ^Package:|awk '{print $2}'|sort -u|xargs apt-fast download