#!/bin/bash
apt-fast install -y libinput-tools
git clone https://github.com/bulletmark/libinput-gestures.git
cd libinput-gestures
sed -i 's/\/usr\/share\/applications/\/etc\/xdg\/autostart/g' libinput-gestures-setup
sed -i 's/update-desktop-database/#update-desktop-database/g' libinput-gestures-setup
sed -i 's/NoDisplay=true/NoDisplay=false/g' libinput-gestures.desktop
sudo checkinstall -D -y \
    --install=no \
    --maintainer bulletmark@github.com \
    --pkgname libinput-gestures \
    --pkgversion `./list-version-hashes|tail -1|awk '{print $1}'` \
    --provides libinput-gestures
cd ..
cp libinput-gestures/libinput-gestures*.deb tmp/packages