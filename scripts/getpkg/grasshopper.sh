#!/bin/bash
set -e
aria2c $(wget -O-https://grasshopper.coding.kiwi/client/downloads|grep amd64.deb|cut -d '"' -f2)