#!/bin/bash
aria2c -o lightworks.deb https://www.lwks.com`wget -qO- https://www.lwks.com$(wget -qO- https://www.lwks.com/get-linux|grep deb|cut -d '"' -f4)|grep 'click here'|cut -d '"' -f2`