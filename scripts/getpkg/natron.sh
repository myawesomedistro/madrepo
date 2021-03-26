#!/bin/bash
set -e
sudo add-apt-repository ppa:ichthyo/natron
grep ^Package: /var/lib/apt/lists/*natron*_Packages|awk '{print $2}'|sort -u|xargs apt-fast download