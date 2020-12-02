#!/bin/bash
sudo add-apt-repository ppa:jstaf/onedriver
grep ^Package /var/lib/apt/lists/*onedriver*_Packages|awk '{print $2}'|sort -u|xargs apt-fast download