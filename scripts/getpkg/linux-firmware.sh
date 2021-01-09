#!/bin/bash
aria2c http://deb.xanmod.org/pool/main/l/linux-firmware/$(wget -O- http://deb.xanmod.org/pool/main/l/linux-firmware/|grep linux-firmware|cut -d '"' -f8|tail -n1)