#!/bin/bash
set -e
aria2c $(curl -u $GAPI_AUTH https://api.github.com/repos/dimitrov-adrian/RcloneTray/releases|grep browser_download_url|grep amd64.deb|head -n1|cut -d '"' -f4)