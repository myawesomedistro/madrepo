#!/bin/bash
set -e
cat /var/lib/apt/lists/*apt-fast*_Packages|grep ^Package:|awk '{print $2}'|sort -u|xargs apt-fast download