#!/bin/bash
set -e
aria2c http://ftp.gnu.org/gnu/coreutils/$(wget -O- http://ftp.gnu.org/gnu/coreutils/|grep .tar.xz|cut -d '"' -f8|tail -n2|head -n1)
tar fJx coreutils*.tar.xz
rm -rf coreutils*.tar.xz
cd coreutils*
git clone https://github.com/jarun/advcpmv
mv $(ls advcpmv/advcpmv*|tail -n1) .
patch -p1 -i advcpmv*.patch
cd advcpmv
ADVCPMV_TAG=`echo $(git describe --always --dirty)-$(git log -1 --date=iso --pretty=format:%cd)|sed 's/\ /-/g'|sed 's/v//g'|sed 's/_/-/g'|sed 's/:/-/g'|sed 's/dirty-//g'|cut -d '-' -f2-7`
cd ..
rm -rf advcpmv
./configure
make
mkdir -p advcpmv/DEBIAN advcpmv/usr/bin advcpmv/usr/local/bin
mv src/cp advcpmv/usr/bin/advcp
mv src/mv advcpmv/usr/bin/advmv
echo '#!/bin/bash
set -e
advcp -g "$@"'|tee advcpmv/usr/local/bin/cp
echo '#!/bin/bash
set -e
advmv -g "$@"'|tee advcpmv/usr/local/bin/mv
chmod +x advcpmv/usr/local/bin/cp advcpmv/usr/local/bin/mv
cat <<EOF |tee advcpmv/DEBIAN/control
Package: advcpmv
Version: $ADVCPMV_TAG
Architecture: all
Maintainer: Mischievous Meerkat <jarun@github.com>
Section: main
Priority: optional
Homepage: https://github.com/jarun/advcpmv
Description: Advanced Copy is a mod for the GNU cp and GNU mv tools which adds a progress bar and provides some info on what's going on. It was written by Florian Zwicke and released under the GPL.
EOF
dpkg-deb -b advcpmv .
cd ..
mv coreutils*/advcpmv*.deb tmp/packages
rm -rf coreutils*