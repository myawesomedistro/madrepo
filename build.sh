#!/bin/bash
set -e
mkdir -p tmp/packages
for script in scripts/mkpkg/*.sh
do
 bash -x $script
done
for script in scripts/getpkg/*.sh
do
 bash -x $script
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