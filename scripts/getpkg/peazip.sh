#!/bin/bash
set -e
aria2c $(wget -O- https://peazip.github.io/peazip-linux.html|grep x86_64.GTK2|head -n1|cut -d '"' -f2)