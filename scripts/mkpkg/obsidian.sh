#!/bin/bash
set -e
OBSIDIAN_TAG=$(wget -O- https://api.github.com/repos/obsidianmd/obsidian-releases/releases/latest|grep tag|head -n1|cut -d '"' -f4|sed 's/https:\/\/github.com\/obsidianmd\/obsidian-releases\/releases\/tag\/v//g')
aria2c https://github.com/$(wget -O- https://github.com/obsidianmd/obsidian-releases/releases?after=v0.9.21|grep amd64.deb|head -n1|cut -d '"' -f2)
dpkg-deb -x obsidian*.deb obsidian
dpkg-deb -e obsidian*.deb obsidian/DEBIAN
rm -rf obsidian*.deb
aria2c $(wget -O- https://api.github.com/repos/obsidianmd/obsidian-releases/releases/latest|grep browser_download_url|grep download|grep asar.gz|head -n1|cut -d '"' -f4)
gzip -dv obsidian*asar.gz
mv obsidian*.asar obsidian/opt/Obsidian/resources/obsidian.asar
sed -i "s/Version: .*/Version: $OBSIDIAN_TAG/g" obsidian/DEBIAN/control
rm -rf obsidian/DEBIAN/md5sum
dpkg-deb -b obsidian .
mv obsidian*.deb tmp/packages
rm -rf obsidian*