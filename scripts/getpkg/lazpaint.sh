#!/bin/bash
set -e
aria2c $(wget -O- --user '$GITHUB'_API_AUTH https://api.github.com/repos/bgrabitmap/lazpaint/releases|grep browser_download_url|grep linux64.deb|head -n1|cut -d '"' -f4)