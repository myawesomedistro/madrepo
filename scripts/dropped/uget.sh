#!/bin/bash
set -e
sudo add-apt-repository ppa:uget-team/ppa
grep ^Package: /var/lib/apt/lists/*uget*_Package:s|awk '{print $2}'|sort -u|xargs apt-fast download