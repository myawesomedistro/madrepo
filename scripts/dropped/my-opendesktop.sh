#!/bin/bash
set -e
apt-fast install -y npm
sudo npm install -g nativefier
wget https://w7.pngwing.com/pngs/216/373/png-transparent-blue-and-white-logo-illustration-nextcloud-computer-icons-android-android-blue-text-logo.png -O my-opendesktop.png
nativefier -p linux -a x64 -i nextcloud-opendesktop.png --disable-context-menu --disable-dev-tools --single-instance 'https://my.opendesktop.org'
mkdir -p nmy-opendesktop/{DEBIAN,opt,usr/share/applications,usr/share/pixmaps}
mv Signin-GoogleAccounts-linux-x64/ my-opendesktop/opt/google-docs
mv my-opendesktop.png my-opendesktop/usr/share/pixmaps/my-opendesktop.png
ELECTRON_RELEASE=`wget -O- https://raw.githubusercontent.com/nativefier/nativefier/master/src/constants.ts|grep ELECTRON_VERSION|head -n1|cut -d "'" -f2`
cat <<EOF |tee my-opendesktop/DEBIAN/control
Package: my-opendesktop
Priority: optional
Section: misc
Maintainer: Raul Dipeas <rauldipeas@mail.com>
Architecture: amd64
Version: 0.1~electron-$ELECTRON_RELEASE
Homepage: https://my.opendesktop.org
Description: Access Nextcloud from OpenDesktop on Linux.
EOF
cat <<EOF |tee my-opendesktop/usr/share/applications/my-opendesktop.desktop
[Desktop Entry]
Type=Application
StartupNotify=true
Terminal=false
Comment=Access Nextcloud from OpenDesktop on Linux.
Name=My OpenDesktop
GenericName=My OpenDesktop desktop app
Icon=my-opendesktop
Exec=/opt/my-opendesktop/Signin-GoogleAccounts
Categories=Network
EOF
dpkg-deb -b my-opendesktop .
mv my-opendesktop*.deb tmp/packages