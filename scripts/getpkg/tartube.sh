#!/bin/bash
set -e
aria2c $(curl -u $GAPI_AUTH https://api.github.com/repos/axcore/tartube/releases|grep browser_download_url|grep STRICT.deb|head -n1|cut -d '"' -f4)