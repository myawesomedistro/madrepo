#!/bin/bash
set -e
aria2c http://ftp.debian.org/debian/pool/non-free/f/fdk-aac/$(curl -s http://ftp.debian.org/debian/pool/non-free/f/fdk-aac/|grep libfdk-aac1|grep amd64.deb|head -n2|tail -n1|cut -d '"' -f8)
aria2c http://mirrors.kernel.org/ubuntu/pool/universe/x/x264/$(curl -s http://mirrors.kernel.org/ubuntu/pool/universe/x/x264/|grep libx264-152|grep amd64.deb|cut -d '"' -f2)
aria2c $(curl -s https://www.stremio.com/downloads|grep amd64.deb|cut -d '"' -f222)