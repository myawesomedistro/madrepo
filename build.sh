#!/bin/bash
set -e
mkdir -p tmp/packages
for script in scripts/mkpkg/*.sh
do
 sed -i 's/sudo//g' $script|bash -x
done
for script in scripts/getpkg/*.sh
do
 sed -i 's/sudo//g' $script|bash -x
done
mv *.deb tmp/packages
find tmp/packages \
    -type f \
    -name '*.deb'\
    |xargs reprepro \
        -P \
        --ask-passphrase \
        -Vb repo \
        includedeb core