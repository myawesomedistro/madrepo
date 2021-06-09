#!/bin/bash
set -e
aria2c $(wget -O- https://vivaldi.com/pt-br/download/|grep .deb|cut -d '"' -f68)