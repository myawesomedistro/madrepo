#!/bin/bash
mkdir -pv tmp/packages
for script in scripts/mkpkg/*.sh
do
 bash $script
done
for script in scripts/getpkg/*.sh
do
 bash $script
done
mv *.deb tmp/packages
find tmp/packages -name '*.deb' -type f|xargs reprepro -P --ask-passphrase -Vb repo includedeb core