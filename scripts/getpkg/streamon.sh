#!/bin/bash
set -e
aria2c $(wget -O- --user "$GITHUB_API_AUTH" https://api.github.com/repos/haxzie/instagram-live-streamer/releases|grep browser_download_url|grep amd64.deb|head -n1|cut -d '"' -f4)