#!/bin/bash
set -e
aria2c $(curl -s https://evernote.com/intl/en/b1433t1422|grep .deb|cut -d '"' -f2)