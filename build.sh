#!/bin/bash
sudo apt install -y checkinstall dpkg-sig reprepro sshpass
mkdir -pv tmp/packages
for f in mkpkg/*.sh
do
 bash $f
done
for f in getpkg/*.sh
do
 bash $f
done
mv *.deb tmp/packages
find tmp/packages -name '*.deb' -type f|xargs dpkg-sig --sign builder
find tmp/packages -name '*.deb' -type f|xargs reprepro -P --ask-passphrase -Vb repo includedeb core