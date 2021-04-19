#!/bin/bash
set -e
aria2c $(curl -s https://slack.com/intl/pt-br/downloads/instructions/ubuntu|grep .deb|cut -d '"' -f394)