#!/bin/bash
set -e
aria2c $(curl -u $GAPI_ID:$GAPI_TOKEN https://api.github.com/repos/derrod/legendary/releases|grep browser_download_url|grep all.deb|head -n1|cut -d '"' -f4)
aria2c $(curl -u $GAPI_ID:$GAPI_TOKEN https://api.github.com/repos/Heroic-Games-Launcher/HeroicGamesLauncher/releases|grep browser_download_url|grep amd64.deb|head -n1|cut -d '"' -f4)