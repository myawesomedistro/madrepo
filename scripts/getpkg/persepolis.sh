#!/bin/bash
set -e
sudo add-apt-repository ppa:persepolis/ppa
grep ^Package: /var/lib/apt/lists/*persepolis*_Package:s|awk '{print $2}'|sort -u|xargs apt-fast download