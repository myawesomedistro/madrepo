#!/bin/bash
set -e
aria2c $(wget -qO- https://api.github.com/repos/TheAssassin/AppImageLauncher/releases|grep browser_download_url|grep download/v|grep amd64.deb|head -n1|cut -d '"' -f4)