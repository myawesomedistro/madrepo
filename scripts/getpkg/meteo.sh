#!/bin/bash
set -e
sudo add-apt-repository ppa:bitseater/ppa
grep ^Package: /var/lib/apt/lists/*bitseater*_Package:s|awk '{print $2}'|sort -u|xargs apt-fast download