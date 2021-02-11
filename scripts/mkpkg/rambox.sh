#!/bin/bash
set -e
aria2c $(wget -O- https://api.github.com/repos/ramboxapp/community-edition/releases|grep browser_download_url|grep amd64.deb|head -n1|cut -d \" -f4)
dpkg-deb -xv Rambox*.deb rambox
dpkg-deb -e Rambox*.deb rambox/DEBIAN
rm -rf Rambox*.deb
npx asar e rambox/opt/Rambox/resources/app.asar app-rambox
echo '
/**
 * Dark background
 */
.x-tab {
  background-color: #000000
}
.x-tab:hover {
  background-color: #090909
}
.x-tab-bar-body {
  background-color: #000000
}
.x-tab.x-tab-active.x-tab-default {
  border-color: white;
  background-color: #090909
}' >> app-rambox/resources/Rambox-all.css
npx asar p app-rambox app.asar
cp -rf app.asar rambox/opt/Rambox/resources/app.asar
dpkg-deb -b rambox .
cp rambox*.deb tmp/packages