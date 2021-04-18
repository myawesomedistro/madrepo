#!/bin/bash
set -e
GLORIOUS_TAG=$(wget -O- --user '$GITHUB'_API_AUTH https://api.github.com/repos/manilarome/lightdm-webkit2-theme-glorious/releases|grep tag|head -n1|cut -d '"' -f4|sed 's/https:\/\/github.com\/manilarome\/lightdm-webkit2-theme-glorious\/releases\/tag\///g')
aria2c https://download.opensuse.org/repositories/home:/antergos/xUbuntu_17.10/amd64/lightdm-webkit2-greeter_2.2.5-1+15.31_amd64.deb
dpkg-deb -x lightdm-webkit2-greeter*.deb lightdm-webkit2-greeter
dpkg-deb -e lightdm-webkit2-greeter*.deb lightdm-webkit2-greeter/DEBIAN
rm lightdm-webkit2-greeter*.deb lightdm-webkit2-greeter/DEBIAN/md5sums
git clone https://github.com/manilarome/lightdm-webkit2-theme-glorious lightdm-webkit2-greeter/usr/share/lightdm-webkit/themes/glorious
mkdir -p lightdm-webkit2-greeter/etc/lightdm/lightdm.conf.d
cat <<EOF |tee lightdm-webkit2-greeter/etc/lightdm/lightdm.conf.d/50-lightdm-webkit2-greeter.conf
[Seat:*]
greeter-session=lightdm-webkit2-greeter
EOF
sed -i 's/antergos/glorious/g' lightdm-webkit2-greeter/etc/lightdm/lightdm-webkit2-greeter.conf
sed -i 's/background_images = \/usr\/share\/backgrounds/background_images = \/usr\/share\/xfce4\/backdrops/g' lightdm-webkit2-greeter/etc/lightdm/lightdm-webkit2-greeter.conf
echo sed -i 's/greeter-session=lightdm-/#greeter-session=lightdm-/g' /etc/lightdm/lightdm.conf|tee lightdm-webkit2-greeter/DEBIAN/postinst
echo sed -i 's/#greeter-session=lightdm-/greeter-session=lightdm-/g' /etc/lightdm/lightdm.conf|tee lightdm-webkit2-greeter/DEBIAN/postrm
chmod +x lightdm-webkit2-greeter/DEBIAN/post*
sed -i "s/2.2.5-1+15.31/2.2.5-1+15.31-glorious-$GLORIOUS_TAG/g" lightdm-webkit2-greeter/DEBIAN/control
dpkg-deb -b lightdm-webkit2-greeter .
mv lightdm-webkit2-greeter*.deb tmp/packages
rm -rf lightdm*