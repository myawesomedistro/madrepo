#!/bin/bash
aria2c $(wget -qO- https://api.github.com/repos/bgrabitmap/lazpaint/releases|grep browser_download_url|grep linux64.deb|head -n1|cut -d '"' -f4)