#!/bin/bash
set -e
DOLIBARR_VER=$(wget -qO- https://www.dolibarr.org/|grep Dolibarr\ ERP\ CRM\ V|head -n1|cut -d 'V' -f2|cut -d ' ' -f1)
DOLIBARR_LINK='https://sourceforge.net/projects/dolibarr/files/Dolibarr%20installer%20for%20Debian-Ubuntu%20%28DoliDeb%29'
DOLIBARR_DOWNLOAD=$(wget -qO- $DOLIBARR_LINK/$DOLIBARR_VER/|grep download_url|cut -d '"' -f18)
aria2c $(echo https\:\/\/sourceforge.net$DOLIBARR_DOWNLOAD|sed 's/ //g')