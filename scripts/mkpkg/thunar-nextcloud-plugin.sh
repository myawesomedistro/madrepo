#!/bin/bash
set -e
apt-fast install -y \
    libexo-2-dev \
    libthunarx-3-dev \
    libxfce4util-dev
git clone https://github.com/frederikmoellers/thunar-nextcloud-plugin tnp-source
cd tnp-source
./compile.sh
cd ..
mkdir -p thunar-nextcloud-plugin/{DEBIAN,usr/lib/x86_64-linux-gnu/thunarx-3}
mv tnp-source/thunar-nextcloud-plugin.so thunar-nextcloud-plugin/usr/lib/x86_64-linux-gnu/thunarx-3/
TNP_VERSION=`echo $(curl -su $GAPI_AUTH https://api.github.com/repos/frederikmoellers/thunar-nextcloud-plugin/commits/master|grep date|head -n 1|cut -d '"' -f4|cut -d \: -f1|cut -d \T -f1)`
cat <<EOF |tee thunar-nextcloud-plugin/DEBIAN/control
Package: thunar-nextcloud-plugin
Priority: optional
Section: misc
Maintainer: Frederik Möllers <frederikmoellers@github.com>
Architecture: amd64
Version: $TNP_VERSION
Depends: libthunarx-3-0
Homepage: https://github.com/frederikmoellers/thunar-nextcloud-plugin
Description: A plugin for sharing files via the Nextcloud client from within the Thunar file manager.
EOF
dpkg-deb -b thunar-nextcloud-plugin .
mv thunar-nextcloud-plugin*.deb tmp/packages
rm -rf thunar-nextcloud-plugin*