#!/bin/bash
set -e
aria2c http://mirrors.kernel.org/ubuntu/pool/main/l/linux-firmware/$(wget -qO- http://mirrors.kernel.org/ubuntu/pool/main/l/linux-firmware/|grep linux-firmware|grep all.deb|tail -n3|head -n1|cut -d '"' -f2)