#!/bin/bash
set -e
aria2c $(curl -u $GAPI_AUTH https://api.github.com/repos/etylermoss/youtube-tv-desktop/releases|grep browser_download_url|grep download|grep amd64.deb|head -n1|cut -d '"' -f4)