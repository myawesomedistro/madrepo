#!/bin/bash
OBSIDIAN_TAG=$(wget -qO- https://api.github.com/repos/obsidianmd/obsidian-releases/releases|grep tag|head -n1|cut -d \" -f4|sed 's/https:\/\/github.com\/obsidianmd\/obsidian-releases\/releases\/tag\/v//g')
aria2c $(wget -qO- https://api.github.com/repos/obsidianmd/obsidian-releases/releases|grep browser_download_url|grep download|grep amd64.deb|head -n1|cut -d '"' -f4)
dpkg-deb -xv obsidian*.deb obsidian
dpkg-deb -e obsidian*.deb obsidian/DEBIAN
rm -rfv obsidian*.deb
aria2c $(wget -qO- https://api.github.com/repos/obsidianmd/obsidian-releases/releases|grep browser_download_url|grep download|grep asar.gz|head -n1|cut -d '"' -f4)
gzip -d obsidian*asar.gz
cp -rf obsidian*.asar obsidian/opt/Obsidian/resources/obsidian.asar
sed -i "s/Version: .*/Version: $OBSIDIAN_TAG/g" obsidian/DEBIAN/control
rm -rfv obsidian/DEBIAN/md5sum
dpkg-deb -b obsidian .
cp obsidian*.deb tmp/packages