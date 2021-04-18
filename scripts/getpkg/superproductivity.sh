#!/bin/bash
set -e
aria2c $(wget -O- --user $GITHUB_API_ID:$GITHUB_API_TOKEN https://api.github.com/repos/johannesjo/super-productivity/releases|grep browser_download_url|grep .deb|head -n1|cut -d '"' -f4)