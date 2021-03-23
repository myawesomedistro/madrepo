#!/bin/bash
set -e
apt-fast install -y npm
sudo npm install -g nativefier
wget https://i.imgur.com/m0abT4k.png -O icon.png
nativefier -p linux -a x64 -i icon.png --disable-context-menu --disable-dev-tools --single-instance https://www.icloud.com/
mkdir -pv icloud/{DEBIAN, opt, usr/share/applications, usr/share/pixmaps}
mv iCloud-linux-64 icloud/opt/icloud
mv icon.png icloud/usr/share/pixmaps/icloud.png
cat <<EOF |tee icloud/DEBIAN/control
Package: icloud
Priority: optional
Section: misc
Maintainer: Raul Dipeas <rauldipeas@mail.com>
Architecture: all
Version: 0.1
Homepage: https://github.com/dundee/gdu
Description: Access Apple iCloud on Linux.
EOF
cat <<EOF |tee icloud/usr/share/applications/icloud.desktop
[Desktop Entry]
Type=Application
StartupNotify=true
Terminal=false
Comment=Access Apple iCloud on Linux.
Name=iCloud
GenericName=Apple iCloud desktop app
Icon=icloud
Exec=/opt/icloud/icloud
Categories=Network
EOF
dpkg-deb -b icloud .
mv icloud*.deb tmp/packages