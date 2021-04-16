#!/bin/bash
set -e
aria2c $(wget -O- https://api.github.com/repos/linuxmint/hypnotix/releases|grep browser_download_url|grep .deb|head -n1|cut -d '"' -f4)