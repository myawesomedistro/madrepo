#!/bin/bash
set -e
aria2c $(curl -u $GITHUB_API_ID:$GITHUB_API_TOKEN https://api.github.com/repos/Automattic/simplenote-electron/releases|grep browser_download_url|grep amd64.deb|head -n1|cut -d '"' -f4)