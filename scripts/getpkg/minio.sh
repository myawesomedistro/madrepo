#!/bin/bash
set -e
aria2c https://dl.min.io/server/minio/release/linux-amd64/$(wget -O- https://dl.min.io/server/minio/release/linux-amd64/|grep deb|head -n1|cut -d '"' -f2|sed 's/\.\///g')
#aria2c https://dl.min.io/client/mc/release/linux-amd64/$(wget -O- https://dl.min.io/client/mc/release/linux-amd64/|grep deb|head -n1|cut -d '"' -f2|sed 's/\.\///g')