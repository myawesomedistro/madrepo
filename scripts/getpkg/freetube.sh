#!/bin/bash
aria2c $(wget -qO- https://api.github.com/repos/FreeTubeApp/FreeTube/releases|grep browser_download_url|grep amd64.deb|head -n1|cut -d '"' -f4)