#!/bin/bash
set -e
aria2c http://mirrors.kernel.org/ubuntu/pool/main/libc/libcdio/$(wget -qO- http://mirrors.kernel.org/ubuntu/pool/main/libc/libcdio/|grep libcdio18|grep amd64.deb|head -n1|cut -d '"' -f2)
aria2c http://mirrors.kernel.org/ubuntu/pool/universe/libd/libdvdread/$(wget -qO- http://mirrors.kernel.org/ubuntu/pool/universe/libd/libdvdread/|grep libdvdread7|grep amd64.deb|head -n1|cut -d '"' -f2)
sudo add-apt-repository ppa:nemonein/bomi
grep ^Package: /var/lib/apt/lists/*bomi*_Packages|awk '{print $2}'|sort -u|xargs apt-fast download