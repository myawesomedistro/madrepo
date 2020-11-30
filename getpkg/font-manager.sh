#!/bin/bash
sudo add-apt-repository ppa:font-manager/staging
grep ^Package /var/lib/apt/lists/*font-manager*_Packages|awk '{print $2}'|sort -u|xargs apt-fast download