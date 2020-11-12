#!/bin/bash
git clone https://gitlab.com/myawesomedistro/madwelcome
rm -rf madwelcome/.git
dpkg-deb -b madwelcome .
cp madwelcome*.deb tmp/packages