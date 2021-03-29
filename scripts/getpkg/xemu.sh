#!/bin/bash
set -e
sudo add-apt-repository ppa:mborgerson/xemu
grep ^Package: /var/lib/apt/lists/*xemu*_Packages|awk '{print $2}'|sort -u|xargs apt-fast download