#!/bin/bash
sudo add-apt-repository ppa:bitseater/ppa
grep ^Package /var/lib/apt/lists/*bitseater*_Packages|awk '{print $2}'|sort -u|xargs apt-fast download