#!/bin/bash
set -e
aria2c $(wget -O- --user $GITHUB_API_AUTH https://api.github.com/repos/duplicati/duplicati/releases|grep browser_download_url|grep .deb|head -n1|cut -d '"' -f4)