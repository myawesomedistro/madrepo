#!/bin/bash
set -e
sudo add-apt-repository ppa:persepolis/ppa
grep ^Package: /var/lib/apt/lists/*persepolis*_Packages|awk '{print $2}'|sort -u|xargs apt-fast download