#!/bin/bash
set -e
sudo add-apt-repository ppa:jurplel/qview
grep ^Package: /var/lib/apt/lists/*qview*_Packages|awk '{print $2}'|sort -u|xargs apt-fast download