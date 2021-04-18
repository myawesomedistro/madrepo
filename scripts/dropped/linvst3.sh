#!/bin/bash
set -e
LINVST_TAG=$(curl -u ${{ secrets.GAPI_ID }}:${{ secrets.GAPI_TOKEN }} https://api.github.com/repos/osxmidi/LinVst3/releases|grep tag|head -n1|cut -d '"' -f4|sed 's/https:\/\/github.com\/osxmidi\/LinVst3\/releases\/tag\///g')
wget $(curl -u ${{ secrets.GAPI_ID }}:${{ secrets.GAPI_TOKEN }} https://api.github.com/repos/osxmidi/LinVst3/releases|grep browser_download_url|grep .zip|head -n1|cut -d '"' -f4)
unzip LinVst*.zip
rm -rf LinVst3*.zip
mkdir -p linvst3/DEBIAN linvst3/usr/bin linvst3/usr/share/LinVst/64bit-32bit
rm -rf LinVst3*/convert/ReadMe
mv LinVst3*/convert/* linvst3/usr/bin/
mv LinVst3*/embedded/linvst3.so linvst3/usr/share/LinVst/64bit-32bit/
mv LinVst3*/embedded/* linvst3/usr/bin/
cat <<EOF |tee linvst3/DEBIAN/control 
Package: linvst3-64bit
Version: $LINVST_TAG
Section: audio
Priority: optional
Architecture: amd64
Maintainer: abc@def.com
Description: Linux Wrapper for 64 bit windows VST3 plugins. See Readme in /usr/share/LinVst.
EOF
dpkg-deb -b linvst3 .
mv linvst3*.deb tmp/packages
rm -rf linvst3* LinVst3*