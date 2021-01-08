#!/bin/bash
aria2c $(wget -qO- https://api.github.com/repos/derrod/legendary/releases|grep browser_download_url|grep all.deb|head -n1|cut -d '"' -f4)
aria2c $(wget -qO- https://api.github.com/repos/flavioislima/HeroicGamesLauncher/releases|grep browser_download_url|grep amd64.deb|head -n1|cut -d '"' -f4)