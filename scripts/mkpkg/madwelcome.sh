#!/bin/bash
set -e
git clone https://gitlab.com/myawesomedistro/madwelcome
cd madwelcome
MADWELCOME_TAG=`echo $(git describe --always --dirty)-$(git log -1 --date=iso --pretty=format:%cd)|sed 's/\ /-/g'|sed 's/v//g'|sed 's/_/-/g'|sed 's/:/-/g'|cut -d '-' -f2-7`
sed -i "s/TAG/$MADWELCOME_TAG/g" DEBIAN/control
rm -rf .git
cd ..
dpkg-deb -b madwelcome .
cp madwelcome*.deb tmp/packages