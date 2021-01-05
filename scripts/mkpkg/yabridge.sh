#!/bin/bash
mkdir -p yabridge/DEBIAN yabridge/usr/bin yabridge/opt yabridge/etc/xdg/autostart
cp assets/yabridge/yabridgectl/yabridgectl yabridge/usr/bin/yabridgectl
cp -r assets/yabridge/yabridge yabridge/opt/
echo '[Desktop Entry]
Name=yabridge
Icon=preferences-plugin
Exec=bash /opt/yabridge/user-data.sh
Terminal=false
Type=Application
StartupNotify=false'|tee yabridge/etc/xdg/autostart/yabridge.desktop
echo '#!/bin/bash
cp -r /opt/yabridge $HOME/.local/share/'|tee yabridge/opt/yabridge/user-data.sh
chmod +x yabridge/opt/yabridge/user-data.sh
YABRIDGE_TAG=`echo $(wget -qO- https://api.github.com/repos/robbert-vdh/yabridge/releases|grep tag|grep -v Next|head -n1|cut -d \" -f4|sed 's/https:\/\/github.com\/robbert-vdh\/yabridge\/releases\/tag\///g')`
YABRIDGE_VER=`echo $(wget -qO- https://api.github.com/repos/robbert-vdh/yabridge/commits/master|grep date|head -n 1|cut -d \" -f4|cut -d \: -f1|cut -d \T -f1)`
echo "Package: yabridge
Version: $YABRIDGE_TAG_$YABRIDGE_VER
Section: audio
Priority: optional
Architecture: amd64
Maintainer: Robbert van der Helm <mail@robbertvanderhelm.nl>
Description: Yet Another way to use Windows VST plugins on Linux. Yabridge seamlessly supports using both 32-bit and 64-bit Windows VST2 and VST3 plugins in a 64-bit Linux VST host as if they were native VST2 and VST3 plugins, with optional support for plugin groups to enable inter-plugin communication for VST2 plugins and quick startup times. Its modern concurrent architecture and focus on transparency allows yabridge to be both fast and highly compatible, while also staying easy to debug and maintain."|tee yabridge/DEBIAN/control
dpkg-deb -b yabridge .
cp yabridge*.deb tmp/packages