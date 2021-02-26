#!/bin/bash
set -e
aria2c $(wget -qO- https://get.delta.chat/pt/download|grep amd64.deb|cut -d '"' -f2)