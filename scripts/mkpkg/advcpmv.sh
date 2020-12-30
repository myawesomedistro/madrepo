#!/bin/bash
aria2c http://ftp.gnu.org/gnu/coreutils/$(wget -O- http://ftp.gnu.org/gnu/coreutils/|grep .tar.xz|cut -d '"' -f8|tail -n2|head -n1)
tar xvJf coreutils*.tar.xz
rm -rf coreutils*.tar.xz
cd coreutils*
git clone https://github.com/jarun/advcpmv
cp -v $(ls advcpmv/advcpmv*|tail -n1) .
patch -p1 -i advcpmv*.patch
cd advcpmv
ADVCPMV_TAG=`echo $(git describe --always --dirty)-$(git log -1 --date=iso --pretty=format:%cd)|sed 's/\ /-/g'|sed 's/v//g'|sed 's/_/-/g'|sed 's/:/-/g'|cut -d '-' -f2-7`
cd ..
rm -rf advcpmv
./configure
make
mkdir -pv advcpmv/DEBIAN advcpmv/usr/bin advcpmv/usr/local/bin
cp src/cp advcpmv/usr/bin/advcp
cp src/mv advcpmv/usr/bin/advmv
echo '#!/bin/bash
advcp -g $@'|tee advcpmv/usr/local/bin/cp
echo '#!/bin/bash
advmv -g $@'|tee advcpmv/usr/local/bin/mv
chmod +x advcpmv/usr/local/bin/cp advcpmv/usr/local/bin/mv
echo "Package: advcpmv
Version: $ADVCPMV_TAG
Architecture: all
Maintainer: Mischievous Meerkat <jarun@github.com>
Section: main
Priority: optional
Homepage: https://github.com/jarun/advcpmv
Description: Advanced Copy is a mod for the GNU cp and GNU mv tools which adds a progress bar and provides some info on what's going on. It was written by Florian Zwicke and released under the GPL."|tee advcpmv/DEBIAN/control
dpkg-deb -b advcpmv .
cd ..
cp coreutils*/advcpmv*.deb tmp/packages