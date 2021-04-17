#!/bin/bash
set -e
git clone https://github.com/corrados/jamulus
cd jamulus/distributions
apt-fast install -y \
	libjack-jackd2-dev \
	qtbase5-dev \
	qttools5-dev-tools
bash build-debian-package.sh
cd ../..
mv jamulus*.deb tmp/packages
rm -rf jamulus*