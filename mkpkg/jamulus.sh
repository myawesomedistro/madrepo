#!/bin/bash
git clone https://github.com/corrados/jamulus
cd jamulus/distributions
bash build-debian-package.sh
cd ../..
cp jamulust*.deb tmp/packages