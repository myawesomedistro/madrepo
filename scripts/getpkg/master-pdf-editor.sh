#!/bin/bash
aria2c $(wget -O- https://code-industry.net/free-pdf-editor/|grep qt5.x86_64.deb|tail -1|cut -d '"' -f132)