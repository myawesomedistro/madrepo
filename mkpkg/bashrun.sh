#!/bin/bash
git clone https://gitlab.com/myawesomedistro/bashrun
rm -rf bashrun/.git
dpkg-deb -b bashrun .
cp bashrun*.deb tmp/packages