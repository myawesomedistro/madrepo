#!/bin/bash
set -e
aria2c https://dl.min.io/server/minio/release/linux-amd64/$(curl -s https://dl.min.io/server/minio/release/linux-amd64/|grep deb|head -n1|cut -d '"' -f2|sed 's/\.\///g')