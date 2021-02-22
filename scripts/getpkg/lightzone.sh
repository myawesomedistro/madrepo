#!/bin/bash
set -e
sudo add-apt-repository ppa:lightzone-team/lightzone
grep ^Package: /var/lib/apt/lists/*lightzone*_Package:s|awk '{print $2}'|sort -u|xargs apt-fast download