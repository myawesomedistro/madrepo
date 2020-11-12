#!/bin/bash
MADWELCOME_TAG=`echo $(git describe --always --dirty)-$(git log -1 --date=short --pretty=format:%cd)|sed 's/v//g'|sed 's/_/-/g'`
git clone https://gitlab.com/myawesomedistro/madwelcome
rm -rf madwelcome/.git
sed -i "s/TAG/$MADWELCOME_TAG" bashrun/DEBIAN/control
dpkg-deb -b madwelcome .
cp madwelcome*.deb tmp/packages