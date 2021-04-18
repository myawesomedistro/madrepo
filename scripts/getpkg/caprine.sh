#!/bin/bash
set -e
aria2c $(curl -u ${{ secrets.GAPI_ID }}:${{ secrets.GAPI_TOKEN }} https://api.github.com/repos/sindresorhus/caprine/releases|grep browser_download_url|grep download|grep amd64.deb|head -n2|tail -n1|cut -d '"' -f4)