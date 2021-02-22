#!/bin/bash
set -e
sudo add-apt-repository ppa:daniruiz/flat-remix
grep ^Package: /var/lib/apt/lists/*flat-remix*_Package:s|awk '{print $2}'|sort -u|xargs apt-fast download