#!/bin/bash
sudo add-apt-repository ppa:lutris-team/lutris
grep ^Package /var/lib/apt/lists/*lutris*_Packages|awk '{print $2}'|sort -u|xargs apt-fast download