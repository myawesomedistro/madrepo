#!/bin/bash
set -e
aria2c $(wget -O- https://api.github.com/repos/Figma-Linux/figma-linux/releases|grep browser_download_url|grep download|grep amd64.deb|head -n1|cut -d '"' -f4)