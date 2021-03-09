#!/bin/bash
set -e
aria2c $(wget -qO- https://api.github.com/repos/robbert-vdh/yabridge/releases|grep browser_download_url|grep download|head -n2|tail -n1|cut -d '"' -f4)
tar -fxz yabridge*.tar.gz
rm -rf yabridge*.tar.gz
mkdir -p yabridge/DEBIAN yabridge/usr/bin yabridge/opt/yabridge yabridge/etc/xdg/autostart
mv yabridge/yabridgectl yabridge/usr/bin/yabridgectl
mv yabridge/libyabridge* yabridge/opt/yabridge/
mv yabridge/yabridge* yabridge/opt/yabridge/
rm -rf yabridge/README.md yabridge/CHANGELOG.md
echo '[Desktop Entry]
Name=yabridge
Icon=preferences-plugin
Exec=bash /opt/yabridge/user-data.sh
Terminal=false
Type=Application
StartupNotify=false'|tee yabridge/etc/xdg/autostart/yabridge.desktop
echo '#!/bin/bash
set -e
cp -rf /opt/yabridge $HOME/.local/share/'|tee yabridge/opt/yabridge/user-data.sh
chmod +x yabridge/opt/yabridge/user-data.sh
YABRIDGE_TAG=`echo $(wget -qO- https://api.github.com/repos/robbert-vdh/yabridge/releases|grep tag|grep -v Next|head -n1|cut -d \" -f4|sed 's/https:\/\/github.com\/robbert-vdh\/yabridge\/releases\/tag\///g')`
echo "Package: yabridge
Version: $YABRIDGE_TAG
Section: audio
Priority: optional
Architecture: amd64
Maintainer: Robbert van der Helm <mail@robbertvanderhelm.nl>
Description: Yet Another way to use Windows VST plugins on Linux. Yabridge seamlessly supports using both 32-bit and 64-bit Windows VST2 and VST3 plugins in a 64-bit Linux VST host as if they were native VST2 and VST3 plugins, with optional support for plugin groups to enable inter-plugin communication for VST2 plugins and quick startup times. Its modern concurrent architecture and focus on transparency allows yabridge to be both fast and highly compatible, while also staying easy to debug and maintain."|tee yabridge/DEBIAN/control
dpkg-deb -b yabridge .
mv yabridge*.deb tmp/packages
rm -rf yabridge*