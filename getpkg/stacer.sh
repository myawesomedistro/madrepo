#!/bin/bash
sudo add-apt-repository ppa:oguzhaninan/stacer
grep ^Package /var/lib/apt/lists/*stacer*_Packages|awk '{print $2}'|sort -u|xargs apt-fast download