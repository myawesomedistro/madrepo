#!/bin/bash
#TARTUBE_URL="https://sourceforge.net/projects/tartube/files"
#TARTUBE_VER=`wget -O- https://sourceforge.net/projects/tartube/files|grep 'files/v'|grep download|head -n1|cut -d '/' -f5`
#TARTUBE_FILE=`wget -O- $TARTUBE_URL/$TARTUBE_VER|grep STRICT.deb|head -n1|cut -d '"' -f2`
#aria2c $TARTUBE_URL/$TARTUBE_VER/$TARTUBE_FILE
aria2c $(wget -O- https://api.github.com/repos/axcore/tartube/releases|grep browser_download_url|grep STRICT.deb|head -n1|cut -d '"' -f4)