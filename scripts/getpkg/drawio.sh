#!/bin/bash
set -e
aria2c $(wget -qO- https://api.github.com/repos/jgraph/drawio-desktop/releases|grep browser_download_url|grep download|grep amd64|head -n1|cut -d '"' -f4)