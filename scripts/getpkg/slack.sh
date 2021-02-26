#!/bin/bash
set -e
aria2c $(wget -qO- https://slack.com/intl/pt-br/downloads/instructions/ubuntu|grep .deb|cut -d '"' -f394)