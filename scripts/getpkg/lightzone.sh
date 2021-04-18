#!/bin/bash
set -e
sudo add-apt-repository ppa:lightzone-team/lightzone
cat /var/lib/apt/lists/*lightzone*_Packages|grep ^Package:|awk '{print $2}'|sort -u|xargs apt-fast download