#!/bin/bash
set -e
aria2c $(curl -u ${{ secrets.GAPI_ID }}:${{ secrets.GAPI_TOKEN }} https://api.github.com/repos/haxzie/instagram-live-streamer/releases|grep browser_download_url|grep amd64.deb|head -n1|cut -d '"' -f4)