#!/bin/bash
set -e
aria2c $(wget -qO- https://api.github.com/repos/KrispyCamel4u/SysMonTask/releases|grep browser_download_url|grep download|grep deb|head -n2|tail -n1|cut -d '"' -f4)