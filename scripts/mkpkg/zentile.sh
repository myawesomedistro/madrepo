#!/bin/bash
set -e
ZENTILE_TAG=$(wget -O- https://api.github.com/repos/blrsn/zentile/releases|grep tag|head -n1|cut -d \" -f4|sed 's/https:\/\/github.com\/blrsn\/zentile\/releases\/tag\/v//g')
mkdir -p zentile/DEBIAN zentile/etc/xdg/autostart zentile/usr/bin zentile/usr/share/applications
wget -O zentile/usr/bin/zentile $(wget -O- https://api.github.com/repos/blrsn/zentile/releases|grep browser_download_url|grep amd64|head -n1|cut -d \" -f4)
chmod +x zentile/usr/bin/zentile
cat <<EOF |tee zentile/DEBIAN/control
Package: zentile
Priority: optional
Section: misc
Maintainer: Berin Larson <blrsn@github.com>
Architecture: amd64
Version: $ZENTILE_TAG
Homepage: https://github.com/blrsn/zentile
Description: On-demand tiling for Openbox, XFCE and other EWMH complaint window managers.
EOF
cat <<EOF |tee zentile/usr/share/applications/zentile.desktop
[Desktop Entry]
Version=1.0
Name=zentile
Comment=On-demand tiling for EWMH complaint window managers.
Exec=sh -c "kill -s USR1 $(pidof zentile)"
Icon=com.github.zren.tiledmenu
Terminal=false
StartupNotify=true
Type=Application
Categories=Settings;DesktopSettings;
EOF
cat <<EOF |tee zentile/etc/xdg/autostart/zentile.desktop
[Desktop Entry]
Version=1.0
Name=zentile
Exec=zentile
Icon=com.github.zren.tiledmenu
Terminal=false
StartupNotify=true
Type=Application
Categories=Settings;DesktopSettings;
EOF
dpkg-deb -b zentile .
mv zentile*.deb tmp/packages
rm -rf zentile*