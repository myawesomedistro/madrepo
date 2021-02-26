#!/bin/bash
set -e
aria2c $(wget -qO- https://api.github.com/repos/muesli/duf/releases|grep browser_download_url|grep download/|grep amd64.deb|cut -d '"' -f4)