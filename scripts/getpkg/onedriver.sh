#!/bin/bash
set -e
sudo add-apt-repository ppa:jstaf/onedriver
cat /var/lib/apt/lists/*onedriver*_Packages|grep ^Package:|awk '{print $2}'|sort -u|xargs apt-fast download