#!/bin/bash
aria2c $(wget -O- https://code-industry.net/free-pdf-editor/|grep 64.deb|tail -1|cut -d '"' -f2)