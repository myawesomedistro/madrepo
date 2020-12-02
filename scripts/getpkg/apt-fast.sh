#!/bin/bash
grep ^Package /var/lib/apt/lists/*apt-fast*_Packages|awk '{print $2}'|sort -u|xargs apt-fast download