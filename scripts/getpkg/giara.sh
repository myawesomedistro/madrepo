#!/bin/bash
set -e
sudo add-apt-repository ppa:ubuntuhandbook1/giara
grep ^Package: /var/lib/apt/lists/*giara*_Package:s|awk '{print $2}'|sort -u|xargs apt-fast download