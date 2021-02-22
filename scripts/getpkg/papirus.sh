#!/bin/bash
set -e
sudo add-apt-repository ppa:papirus/papirus-dev
grep ^Package: /var/lib/apt/lists/*papirus-dev*_Packages|awk '{print $2}'|sort -u|xargs apt-fast download