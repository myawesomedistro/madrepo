#!/bin/bash
set -e
aria2c $(wget -O-'https://www.nomachine.com/download/download&id=1'|grep amd64.deb|head -n1|cut -d "'" -f4)
