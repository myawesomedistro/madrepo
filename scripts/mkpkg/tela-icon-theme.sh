#!/bin/bash
set -e
TELA_TAG=$(wget -O- --user rauldipeas:$GITHUB_API_AUTH https://api.github.com/repos/vinceliuice/Tela-icon-theme/releases|grep tag|head -n1|cut -d '"' -f4|sed 's/https:\/\/github.com\/vinceliuice\/Tela-icon-theme\/releases\/tag\///g')
git clone https://github.com/vinceliuice/Tela-icon-theme
cd Tela-icon-theme/
sudo ./install.sh -a
cd ..
rm -rf Tela-icon-theme
sudo sed -i 's/hicolor/Papirus/g' /usr/share/icons/Tela*/index.theme
sudo sed -i 's/Papirus/Papirus-Dark/g' /usr/share/icons/Tela*-dark*/index.theme
mkdir -p tela-icon-theme/DEBIAN tela-icon-theme/usr/share/icons
cat <<EOF |tee tela-icon-theme/DEBIAN/control
Package: tela-icon-theme
Priority: optional
Section: misc
Maintainer: VinceLiuice <vinceliuice@hotmail.com>
Architecture: all
Version: $TELA_TAG
Depends: hicolor-icon-theme, papirus-icon-theme
Homepage: https://github.com/vinceliuice/Tela-icon-theme
Description: A flat colorful design icon theme for linux desktops
EOF
cat <<EOF |tee tela-icon-theme/DEBIAN/postinst
#!/bin/sh
set -e

if [ "$1" = "configure" ]||[ "$1" = "abort-upgrade" ]||[ "$1" = "abort-deconfigure" ]||[ "$1" = "abort-remove" ] ; then
	if which update-icon-caches >/dev/null 2>&1 ; then
		update-icon-caches /usr/share/icons/Tela /usr/share/icons/Tela-dark
	fi
fi
EOF
cat <<EOF |tee tela-icon-theme/DEBIAN/postrm
#!/bin/sh
set -e

if which update-icon-caches >/dev/null 2>&1 ; then
	update-icon-caches /usr/share/icons/Tela /usr/share/icons/Tela-dark
fi
EOF
chmod +x tela-icon-theme/DEBIAN/post*
cp -rf /usr/share/icons/Tela* tela-icon-theme/usr/share/icons/
dpkg-deb -b tela-icon-theme .
mv tela-icon-theme*.deb tmp/packages
rm -rf tela-icon-theme*