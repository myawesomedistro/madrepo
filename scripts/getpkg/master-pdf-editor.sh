#!/bin/bash
set -e
aria2c $(wget -qO- https://code-industry.net/free-pdf-editor/|grep qt5.x86_64.deb|tail -1|cut -d '"' -f132)