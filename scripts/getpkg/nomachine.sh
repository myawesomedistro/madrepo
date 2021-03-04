#!/bin/bash
set -e
aria2c $(wget -qO- 'https://www.nomachine.com/download/download&id=6'|grep amd64.deb|head -n1|cut -d "'" -f4)