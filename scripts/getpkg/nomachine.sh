#!/bin/bash
aria2c $(wget -qO- 'https://www.nomachine.com/download/download&id=1'|grep amd64.deb|head -n1|cut -d "'" -f4)