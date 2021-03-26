#!/bin/bash
set -e
apt-fast install -y npm
sudo npm install -g nativefier
wget https://i.imgur.com/m0abT4k.png -O icon.png
nativefier -p linux -a x64 -i icon.png --disable-context-menu --disable-dev-tools --single-instance https://www.icloud.com/
mkdir -p icloud/{DEBIAN,opt,usr/share/applications,usr/share/pixmaps}
mv iCloud-linux-x64 icloud/opt/iCloud
mv icon.png icloud/usr/share/pixmaps/icloud.png
#ELECTRON_RELEASE=`wget -qO- https://www.electronjs.org/releases/stable|grep release-entry|head -n1|cut -d '"' -f4`
ELECTRON_RELEASE=`wget -qO- https://raw.githubusercontent.com/nativefier/nativefier/master/src/constants.ts|grep ELECTRON_VERSION|head -n1|cut -d "'" -f2`
cat <<EOF |tee icloud/DEBIAN/control
Package: icloud
Priority: optional
Section: misc
Maintainer: Raul Dipeas <rauldipeas@mail.com>
Architecture: all
Version: 0.1~electron-$ELECTRON_RELEASE
Homepage: https://icloud.com
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
Exec=/opt/iCloud/iCloud
Categories=Network
EOF
dpkg-deb -b icloud .
mv icloud*.deb tmp/packages