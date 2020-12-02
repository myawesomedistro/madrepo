#!/bin/bash
aria2c $(wget -qO- https://api.github.com/repos/sharkdp/bat/releases|grep browser_download_url|grep download/v|grep amd64.deb|head -n2|tail -n1|cut -d '"' -f4)