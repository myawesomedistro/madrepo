#!/bin/bash
sudo add-apt-repository ppa:yannubuntu/boot-repair
grep ^Package /var/lib/apt/lists/*boot-repair*_Packages|awk '{print $2}'|sort -u|xargs apt-fast download