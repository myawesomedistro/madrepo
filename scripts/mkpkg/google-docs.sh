#!/bin/bash
set -e
apt-fast install -y npm
sudo npm install -g nativefier
wget https://upload.wikimedia.org/wikipedia/commons/thumb/1/18/Google_Docs_icon_%282020%29.svg/250px-Google_Docs_icon_%282020%29.svg.png -O google-docs.png
nativefier -p linux -a x64 -i google-docs.png --disable-context-menu --disable-dev-tools --single-instance --internal-urls ".*" -f --user-agent "Mozilla/5.0 (X11; Ubuntu; Linux x86_64; rv:70.0) Gecko/20100101 Firefox/70.0" --internal-urls "(.*?docs\.google\.com.*?|.*?accounts\.google\.com.*?)" 'https://www.docs.google.com'
mkdir -p google-docs/{DEBIAN,opt,usr/share/applications,usr/share/pixmaps}
mv Signin-GoogleAccounts-linux-x64/ google-docs/opt/google-docs
mv google-docs.png google-docs/usr/share/pixmaps/google-docs.png
ELECTRON_RELEASE=`curl -s https://raw.githubusercontent.com/nativefier/nativefier/master/src/constants.ts|grep ELECTRON_VERSION|head -n1|cut -d "'" -f2`
cat <<EOF |tee google-docs/DEBIAN/control
Package: google-docs
Priority: optional
Section: misc
Maintainer: Raul Dipeas <rauldipeas@mail.com>
Architecture: amd64
Version: 0.1~electron-$ELECTRON_RELEASE
Homepage: https://docs.google.com
Description: Access Google Docs on Linux.
EOF
cat <<EOF |tee google-docs/usr/share/applications/google-docs.desktop
[Desktop Entry]
Type=Application
StartupNotify=true
Terminal=false
Comment=Access Google Docs on Linux.
Name=Google Docs
GenericName=Google Docs desktop app
Icon=google-docs
Exec=/opt/google-docs/Signin-GoogleAccounts
Categories=Network
EOF
dpkg-deb -b google-docs .
mv google-docs*.deb tmp/packages