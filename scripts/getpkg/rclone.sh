#!/bin/bash
set -e
#aria2c https://downloads.rclone.org/rclone-current-linux-amd64.deb
aria2c $(curl -su $GAPI_AUTH https://api.github.com/repos/rclone/rclone/releases|grep browser_download_url|grep amd64.deb|head -n1|cut -d '"' -f4)