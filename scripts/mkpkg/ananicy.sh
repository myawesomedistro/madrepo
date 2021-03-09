#/bin/bash
git clone https://github.com/Nefelim4ag/Ananicy
./Ananicy/package.sh debian
mv Ananicy/ananicy-*.deb tmp/packages
rm -rf Ananicy*