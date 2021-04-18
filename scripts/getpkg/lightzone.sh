#!/bin/bash
set -e
sudo add-apt-repository ppa:lightzone-team/lightzone
lz4cat -d /var/lib/apt/lists/*lightzone*_Packages.lz4|grep ^Package:|awk '{print $2}'|sort -u|xargs apt-fast download