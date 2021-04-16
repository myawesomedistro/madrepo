#!/bin/bash
set -e
echo 'deb http://jetbrains-ppa.s3-website.eu-central-1.amazonaws.com bionic main'|sudo tee /etc/apt/sources.list.d/jetbrains.list
wget -O- https://s3.eu-central-1.amazonaws.com/jetbrains-ppa/0xA6E8698A.pub.asc|gpg --dearmor|sudo tee /etc/apt/trusted.gpg.d/jetbrains.gpg>/dev/null
apt-fast update
grep ^Package: /var/lib/apt/lists/*jetbrains*_Packages|awk '{print $2}'|sort -u|xargs apt-fast download