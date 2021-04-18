#!/bin/bash
set -e
aria2c $(wget -O- --user $GITHUB_API_AUTH https://api.github.com/repos/ransome1/sleek/releases|grep browser_download_url|grep download|grep amd64.deb|head -n1|cut -d '"' -f4)