#!/bin/bash
set -e
aria2c $(curl -u $GAPI_AUTH https://api.github.com/repos/minbrowser/min/releases|grep browser_download_url|grep download/v|grep amd64.deb|head -n1|cut -d '"' -f4)