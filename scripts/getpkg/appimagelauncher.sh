#!/bin/bash
set -e
aria2c $(curl -u $GITHUB_API_ID:$GITHUB_API_TOKEN https://api.github.com/repos/TheAssassin/AppImageLauncher/releases|grep browser_download_url|grep download/v|grep amd64.deb|head -n1|cut -d '"' -f4)