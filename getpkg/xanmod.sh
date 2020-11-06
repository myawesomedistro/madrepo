#!/bin/bash
wget https://dl.xanmod.org/xanmod-repository.deb
sudo apt-fast install -y --no-install-recommends ./xanmod*.deb
rm -rfv xanmod*.deb
# Remoção dos repositórios do Azure
#echo ''|sudo tee /etc/apt/sources.list
#sudo rm -rfv /etc/apt/sources.list.d/*
sudo apt update
grep ^Package /var/lib/apt/lists/*xanmod*_Packages|awk '{print $2}'|sort -u|xargs apt-fast download