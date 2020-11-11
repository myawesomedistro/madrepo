#!/bin/bash
git clone https://gitlab.com/myawesomedistro/bashrun
dpkg-deb -b bashrun .
cp bashrun*.deb tmp/packages