#!/bin/bash
git clone https://gitlab.com/myawesomedistro/bashrun
cd bashrun
cat usr/bin/bashrun-url|sed "s/BASHRUN_GL_TOKEN/$BASHRUN_GL_TOKEN/g"|tee usr/bin/bashrun-url
shc -f usr/bin/bashrun-url -o usr/bin/bashrun-url
BASHRUN_TAG=`echo $(git describe --always --dirty)-$(git log -1 --date=iso --pretty=format:%cd)|sed 's/\ /-/g'|sed 's/v//g'|sed 's/_/-/g'|sed 's/:/-/g'|cut -d '-' -f2-7`
sed -i "s/TAG/$BASHRUN_TAG/g" DEBIAN/control
rm -rf .git
cd ..
dpkg-deb -b bashrun .
cp bashrun*.deb tmp/packages