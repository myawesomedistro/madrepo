#!/bin/bash
aria2c $(wget -O- https://api.github.com/repos/manosim/gitify/releases|grep browser_download_url|grep amd64.deb|head -n1|cut -d '"' -f4)