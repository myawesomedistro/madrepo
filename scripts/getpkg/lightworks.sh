#!/bin/bash
set -e
aria2c -o lightworks.deb https://www.lwks.com`wget -O- https://www.lwks.com$(wget -O- https://www.lwks.com/get-linux|grep deb|cut -d '"' -f4)|grep 'click here'|cut -d '"' -f2`