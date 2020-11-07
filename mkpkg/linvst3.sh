#!/bin/bash
LINVST_TAG=$(wget -qO- https://api.github.com/repos/osxmidi/LinVst3/releases|grep tag|head -n1|cut -d \" -f4|sed 's/https:\/\/github.com\/osxmidi\/LinVst3\/releases\/tag\///g')
wget $(wget -qO- https://api.github.com/repos/osxmidi/LinVst3/releases|grep browser_download_url|grep .zip|head -n1|cut -d \" -f4)
unzip LinVst*.zip
rm -rv LinVst3*.zip
mkdir -pv linvst3/DEBIAN linvst3/usr/bin linvst3/usr/share/LinVst/64bit-32bit
rm -rf LinVst3*/convert/ReadMe
cp -rf LinVst3*/convert/* linvst3/usr/bin/
mv -v LinVst3*/embedded/linvst3.so linvst3/usr/share/LinVst/64bit-32bit/
cp -rf LinVst3-2.15/embedded/* linvst3/usr/bin/
echo "Package: linvst3-64bit
Version: $LINVST_TAG
Section: audio
Priority: optional
Architecture: amd64
Maintainer: abc@def.com
Description: Linux Wrapper for 64 bit windows VST3 plugins. See Readme in /usr/share/LinVst."|tee linvst3/DEBIAN/control
rm -rf LinVst3*
dpkg-deb -b linvst3 .
rm -rf linvst3
cp linvst3*.deb tmp/packages