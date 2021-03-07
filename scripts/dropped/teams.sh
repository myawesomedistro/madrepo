#!/bin/bash
set -e
aria2c https://packages.microsoft.com/repos/ms-teams/pool/main/t/teams/$(wget -qO- https://packages.microsoft.com/repos/ms-teams/pool/main/t/teams|grep .deb|tail -n1|cut -d '"' -f2)