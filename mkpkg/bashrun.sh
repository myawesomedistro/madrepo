#!/bin/bash
BASHRUN_TAG=`echo $(git describe --always --dirty)-$(git log -1 --date=short --pretty=format:%cd)|sed 's/v//g'|sed 's/_/-/g'`
git clone https://gitlab.com/myawesomedistro/bashrun
rm -rf bashrun/.git
sed -i "s/TAG/$BASHRUN_TAG" bashrun/DEBIAN/control
dpkg-deb -b bashrun .
cp bashrun*.deb tmp/packages