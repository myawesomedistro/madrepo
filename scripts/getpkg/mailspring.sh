#!/bin/bash
set -e
aria2c $(wget -O- --user $GITHUB_API_ID:$GITHUB_API_TOKEN https://api.github.com/repos/Foundry376/Mailspring/releases|grep browser_download_url|grep amd64.deb|head -n1|cut -d '"' -f4)