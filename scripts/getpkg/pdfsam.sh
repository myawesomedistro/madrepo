#!/bin/bash
set -e
aria2c $(wget -qO- https://api.github.com/repos/torakiki/pdfsam/releases|grep browser_download_url|grep amd64.deb|head -n1|cut -d '"' -f4)