#!/bin/bash
set -e
aria2c $(curl -s https://rstudio.com/products/rstudio/download/|grep amd64.deb|grep bionic|head -n1|cut -d '"' -f2)