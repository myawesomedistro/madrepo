#!/bin/bash
set -e
aria2c $(curl -su $GAPI_AUTH https://api.github.com/repos/duplicati/duplicati/releases|grep browser_download_url|grep .deb|head -n1|cut -d '"' -f4)