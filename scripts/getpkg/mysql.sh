#!/bin/bash
set -e
aria2c http://mirrors.kernel.org/ubuntu/pool/main/m/mpdecimal/$(wget -O- http://mirrors.kernel.org/ubuntu/pool/main/m/mpdecimal/|grep libmpdec2|grep amd64.deb|tail -n2|head -n1|cut -d '"' -f2)
aria2c http://security.ubuntu.com/ubuntu/pool/main/p/python3.8/$(wget -O- http://security.ubuntu.com/ubuntu/pool/main/p/python3.8/|grep libpython3.8-minimal|grep amd64.deb|head -n1|cut -d '"' -f8)
aria2c http://security.ubuntu.com/ubuntu/pool/main/p/python3.8/$(wget -O- http://security.ubuntu.com/ubuntu/pool/main/p/python3.8/|grep libpython3.8-stdlib|grep amd64.deb|head -n1|cut -d '"' -f8)
aria2c http://security.ubuntu.com/ubuntu/pool/main/p/python3.8/$(wget -O- http://security.ubuntu.com/ubuntu/pool/main/p/python3.8/|grep libpython3.8_|grep amd64.deb|head -n1|cut -d '"' -f8)
aria2c http://mirrors.kernel.org/ubuntu/pool/universe/libz/libzip/$(wget -O- http://mirrors.kernel.org/ubuntu/pool/universe/libz/libzip/|grep libzip5|grep amd64.deb|cut -d '"' -f2)
aria2c https://dev.mysql.com/get/mysql-apt-config_0.8.16-1_all.deb
apt-fast install -y ./mysql-apt-config*.deb
apt-fast update
rm mysql-apt-config*.deb
grep ^Package: /var/lib/apt/lists/*mysql*_Packages|awk '{print $2}'|sort -u|xargs apt-fast download