#!/bin/bash
set -e
grep ^Package: /var/lib/apt/lists/*apt-fast*_Package:s|awk '{print $2}'|sort -u|xargs apt-fast download