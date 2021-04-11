#!/bin/bash
set -e
if wget https://update.send-anywhere.com/linux_downloads/sendanywhere_latest_amd64.deb 2>/dev/null
then
   echo "Download do Send Anywhere concluído com sucesso!"
else
   echo "O Download do Send Anywhere falhou, copiano um arquivo local..."
   cp -v assets/sendanywhere*.deb .
fi