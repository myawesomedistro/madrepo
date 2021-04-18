#!/bin/bash
set -e
aria2c $(curl -u ${{ secrets.GAPI_ID }}:${{ secrets.GAPI_TOKEN }} https://api.github.com/repos/osxmidi/LinVst/releases|grep browser_download_url|grep 64bit|grep .deb|head -n1|cut -d '"' -f4)
aria2c $(curl -u ${{ secrets.GAPI_ID }}:${{ secrets.GAPI_TOKEN }} https://api.github.com/repos/osxmidi/LinVst/releases|grep browser_download_url|grep packages|head -n1|cut -d '"' -f4)
unzip LinVst*packages*.zip
mv LinVst*packages*/*/*.deb .