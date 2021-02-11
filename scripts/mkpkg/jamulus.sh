#!/bin/bash
set -e
git clone https://github.com/corrados/jamulus
cd jamulus/distributions
bash build-debian-package.sh
cd ../..
cp jamulus*.deb tmp/packages