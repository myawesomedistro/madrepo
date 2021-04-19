#!/bin/bash
set -e
aria2c http://mirrors.kernel.org/ubuntu/pool/universe/libz/libzip/$(curl -s http://mirrors.kernel.org/ubuntu/pool/universe/libz/libzip/|grep libzip5|grep amd64.deb|cut -d '"' -f2)
aria2c http://mirrors.kernel.org/ubuntu/pool/main/m/mpdecimal/$(curl -s http://mirrors.kernel.org/ubuntu/pool/main/m/mpdecimal/|grep libmpdec2|grep amd64.deb|tail -n2|head -n1|cut -d '"' -f2)
aria2c http://security.ubuntu.com/ubuntu/pool/main/p/python3.8/$(curl -s http://security.ubuntu.com/ubuntu/pool/main/p/python3.8/|grep libpython3.8_|grep amd64.deb|head -n1|cut -d '"' -f8)
aria2c http://security.ubuntu.com/ubuntu/pool/main/p/python3.8/$(curl -s http://security.ubuntu.com/ubuntu/pool/main/p/python3.8/|grep libpython3.8-minimal|grep amd64.deb|head -n1|cut -d '"' -f8)
aria2c http://security.ubuntu.com/ubuntu/pool/main/p/python3.8/$(curl -s http://security.ubuntu.com/ubuntu/pool/main/p/python3.8/|grep libpython3.8-stdlib|grep amd64.deb|head -n1|cut -d '"' -f8)
cat <<EOF |sudo tee /etc/apt/sources.list.d/mysql.list
deb http://repo.mysql.com/apt/debian/ buster mysql-8.0
deb http://repo.mysql.com/apt/debian/ buster mysql-apt-config
deb http://repo.mysql.com/apt/debian/ buster mysql-cluster-8.0
deb http://repo.mysql.com/apt/debian/ buster mysql-tools
EOF
cat assets/mysql-key.gpg|gpg --dearmor|sudo tee /etc/apt/trusted.gpg.d/mysql.gpg
apt-fast update
cat /var/lib/apt/lists/*mysql*_Packages|grep ^Package:|awk '{print $2}'|sort -u|xargs apt-fast download