#!/bin/bash
set -e
aria2c http://security.ubuntu.com/ubuntu/pool/main/libj/libjpeg-turbo/$(wget -O- http://security.ubuntu.com/ubuntu/pool/main/libj/libjpeg-turbo/|grep libjpeg-turbo8_|grep amd64.deb|tail -n4|head -n1|cut -d '"' -f8)
aria2c http://mirrors.kernel.org/ubuntu/pool/main/libj/libjpeg8-empty/$(wget -O- http://mirrors.kernel.org/ubuntu/pool/main/libj/libjpeg8-empty/|grep libjpeg8_|grep amd64.deb|tail -n1|cut -d '"' -f2)
aria2c http://mirrors.kernel.org/ubuntu/pool/universe/o/openimageio/$(wget -O- http://mirrors.kernel.org/ubuntu/pool/universe/o/openimageio/|grep libopenimageio2.1|grep amd64.deb|head -n1|cut -d '"' -f2)
aria2c http://mirrors.kernel.org/ubuntu/pool/universe/o/openvdb/$(wget -O- http://mirrors.kernel.org/ubuntu/pool/universe/o/openvdb/|grep libopenvdb6.2|grep amd64.deb|cut -d '"' -f2)
aria2c http://mirrors.kernel.org/ubuntu/pool/main/p/poppler/$(wget -O- http://mirrors.kernel.org/ubuntu/pool/main/p/poppler/|grep libpoppler97|grep amd64.deb|cut -d '"' -f2)
sudo add-apt-repository ppa:ichthyo/natron
lz4cat -d /var/lib/apt/lists/*natron*_Packages.lz4|grep ^Package:|awk '{print $2}'|sort -u|xargs apt-fast download