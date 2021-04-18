#!/bin/bash
set -e
aria2c http://mirrors.kernel.org/ubuntu/pool/main/libc/libcdio/$(wget -O- http://mirrors.kernel.org/ubuntu/pool/main/libc/libcdio/|grep libcdio18|grep amd64.deb|head -n1|cut -d '"' -f2)
aria2c http://mirrors.kernel.org/ubuntu/pool/universe/libd/libdvdread/$(wget -O- http://mirrors.kernel.org/ubuntu/pool/universe/libd/libdvdread/|grep libdvdread7|grep amd64.deb|head -n1|cut -d '"' -f2)
sudo add-apt-repository ppa:nemonein/bomi
cat /var/lib/apt/lists/*bomi*_Packages|grep ^Package:|awk '{print $2}'|sort -u|xargs apt-fast download