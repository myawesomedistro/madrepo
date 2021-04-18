#!/bin/bash
set -e
aria2c $(curl -u ${{ secrets.GAPI_ID }}:${{ secrets.GAPI_TOKEN }} https://api.github.com/repos/muesli/duf/releases|grep browser_download_url|grep download/|grep amd64.deb|cut -d '"' -f4)