#!/bin/bash
set -e
DEADD_TAG=$(curl -u $GAPI_ID:$GAPI_TOKEN https://api.github.com/repos/phuhl/linux_notification_center/releases|grep tag|head -n1|cut -d '"' -f4|sed 's/https:\/\/github.com\/phuhl\/linux_notification_center\/releases\/tag\///g')
mkdir -p linux-notification-center/DEBIAN linux-notification-center/etc/xdg/autostart linux-notification-center/usr/bin linux-notification-center/usr/share/applications
wget -O linux-notification-center/usr/bin/deadd-notification-center $(curl -u $GAPI_ID:$GAPI_TOKEN https://api.github.com/repos/phuhl/linux_notification_center/releases|grep browser_download_url|head -n1|cut -d '"' -f4)
chmod +x linux-notification-center/usr/bin/deadd-notification-center
cat <<EOF |tee linux-notification-center/DEBIAN/control
Package: linux-notification-center
Priority: optional
Section: misc
Maintainer: Philipp Uhl <git@ph-uhl.com>
Architecture: amd64
Version: $DEADD_TAG
Homepage: https://github.com/phuhl/linux_notification_center
Description: A haskell-written notification center for users that like a desktop with style…
EOF
cat <<EOF |tee linux-notification-center/usr/share/applications/linux-notification-center.desktop
[Desktop Entry]
Version=1.0
Name=Linux Notification Center
Comment=Central de notificações do Linux
Exec=sh -c "kill -s USR1 $(pidof deadd-notification-center)"
Icon=xfce4-notifyd
Terminal=false
StartupNotify=true
Type=Application
Categories=Settings;DesktopSettings;
EOF
cat <<EOF |tee linux-notification-center/etc/xdg/autostart/linux-notification-center.desktop
[Desktop Entry]
Version=1.0
Name=Linux Notification Center
Exec=deadd-notification-center
Icon=xfce4-notifyd
Terminal=false
StartupNotify=true
Type=Application
Categories=Settings;DesktopSettings;
EOF
dpkg-deb -b linux-notification-center .
mv linux-notification-center*.deb tmp/packages
rm -rf linux-notification-center*