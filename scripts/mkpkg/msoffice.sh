#!/bin/bash
set -e
apt-fast install -y npm
sudo npm install -g nativefier
wget https://i.imgur.com/GF0Srjo.png -O microsoft-office-online.png
nativefier -p linux -a x64 -i microsoft-office-online.png --disable-context-menu --disable-dev-tools --single-instance --internal-urls ".*" 'https://www.office.com/?flight=unauthrefresh&auth=1'
mkdir -p msoffice/{DEBIAN,opt,usr/share/applications,usr/share/pixmaps}
mv SignintoyourMicrosoftaccount-linux-x64/ msoffice/opt/msoffice
mv microsoft-office-online.png msoffice/usr/share/pixmaps/microsoft-office-online.png
ELECTRON_RELEASE=`wget -O- https://raw.githubusercontent.com/nativefier/nativefier/master/src/constants.ts|grep ELECTRON_VERSION|head -n1|cut -d "'" -f2`
cat <<EOF |tee msoffice/DEBIAN/control
Package: msoffice
Priority: optional
Section: misc
Maintainer: Raul Dipeas <rauldipeas@mail.com>
Architecture: amd64
Version: 0.1~electron-$ELECTRON_RELEASE
Homepage: https://office.com
Description: Access Microsoft Office on Linux.
EOF
cat <<EOF |tee msoffice/usr/share/applications/msoffice.desktop
[Desktop Entry]
Type=Application
StartupNotify=true
Terminal=false
Comment=Access Microsoft Office on Linux.
Name=Microsof Office
GenericName=Microsoft Office desktop app
Icon=microsoft-office-online
Exec=/opt/msoffice/SignintoyourMicrosoftaccount
Categories=Network
EOF
dpkg-deb -b msoffice .
mv msoffice*.deb tmp/packages