#!/bin/bash
sudo add-apt-repository ppa:apt-fast/stable
sudo apt install -y apt-fast checkinstall dpkg-sig reprepro sshpass
mkdir -pv tmp/packages
bash mkpkg/*.sh
bash getpkg/*.sh
mv *.deb tmp/packages
find tmp/packages -name '*.deb' -type f|xargs dpkg-sig --sign builder
find tmp/packages -name '*.deb' -type f|xargs reprepro -P --ask-passphrase -Vb repo includedeb core