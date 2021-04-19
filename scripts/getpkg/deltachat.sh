#!/bin/bash
set -e
aria2c $(wget -O-https://get.delta.chat/pt/download|grep amd64.deb|cut -d '"' -f2)