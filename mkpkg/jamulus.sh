#!/bin/bash
git clone https://github.com/corrados/jamulus
cd jamulus/distribuitions
bash build-debian-package.sh
cd ../..
cp jamulust*.deb tmp/packages