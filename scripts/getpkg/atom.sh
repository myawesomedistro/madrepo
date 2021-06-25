#!/bin/bash
set -e
#aria2c -o atom.deb https://atom.io/download/deb
aria2c $(curl -su $GAPI_AUTH https://api.github.com/repos/atom/atom/releases|grep browser_download_url|grep download|grep amd64.deb|head -n1|cut -d '"' -f4)