#!/bin/bash
sudo add-apt-repository ppa:ubuntuhandbook1/giara
grep ^Package /var/lib/apt/lists/*giara*_Packages|awk '{print $2}'|sort -u|xargs apt-fast download