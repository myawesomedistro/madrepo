#!/bin/bash
set -e
aria2c $(curl -s https://safing.io/portmaster|grep deb|cut -d '"' -f2)