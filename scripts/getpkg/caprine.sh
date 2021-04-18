#!/bin/bash
set -e
aria2c $(curl -u $GITHUB_API_ID:$GITHUB_API_TOKEN https://api.github.com/repos/sindresorhus/caprine/releases|grep browser_download_url|grep download|grep amd64.deb|head -n2|tail -n1|cut -d '"' -f4)