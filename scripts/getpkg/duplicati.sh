#!/bin/bash
aria2c $(wget -qO- https://api.github.com/repos/duplicati/duplicati/releases|grep browser_download_url|grep .deb|head -n1|cut -d '"' -f4)