#!/bin/bash
set -e
lz4cat -d /var/lib/apt/lists/*apt-fast*_Packages.lz4|grep ^Package:|awk '{print $2}'|sort -u|xargs apt-fast download