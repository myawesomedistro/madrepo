#!/bin/bash
set -e
aria2c $(curl -u ${{ secrets.GAPI_ID }}:${{ secrets.GAPI_TOKEN }} https://api.github.com/repos/myazarc/AsarUI/releases|grep browser_download_url|grep download|grep .deb|head -n1|cut -d '"' -f4)