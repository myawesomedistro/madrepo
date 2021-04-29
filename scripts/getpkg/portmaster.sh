#!/bin/bash
set -e
aria2c $(wget -O- https://safing.io/portmaster|grep deb|cut -d '"' -f2)