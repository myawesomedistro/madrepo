#!/bin/bash
set -e
git clone https://gitlab.com/myawesomedistro/bashrun
cd bashrun
BASHRUN_TAG=`echo $(git describe --always --dirty)-$(git log -1 --date=iso --pretty=format:%cd)|sed 's/\ /-/g'|sed 's/v//g'|sed 's/_/-/g'|sed 's/:/-/g'|sed 's/dirty-//g'|cut -d '-' -f2-7`
sed -i "s/TAG/$BASHRUN_TAG/g" DEBIAN/control
rm -rf .git
cd ..
dpkg-deb -b bashrun .
mv bashrun*.deb tmp/packages