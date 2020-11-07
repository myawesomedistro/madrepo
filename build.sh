#!/bin/bash
sudo sed -i 's/_APTMGR=apt-get/_APTMGR=apt/g' /etc/apt-fast.conf
sudo apt-fast install -y checkinstall dpkg-sig reprepro sshpass
sudo dpkg --add-architecture i386
mkdir -pv tmp/packages
for script in mkpkg/*.sh
do
 bash $script
done
for script in getpkg/*.sh
do
 bash $script
done
mv *.deb tmp/packages
find tmp/packages -name '*.deb' -type f|xargs dpkg-sig --sign builder
find tmp/packages -name '*.deb' -type f|xargs reprepro -P --ask-passphrase -Vb repo includedeb core