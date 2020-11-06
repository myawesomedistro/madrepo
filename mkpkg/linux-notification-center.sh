#!/bin/bash
DEADD_TAG=$(wget -qO- https://api.github.com/repos/phuhl/linux_notification_center/releases|grep tag|head -n1|cut -d \" -f4|sed 's/https:\/\/github.com\/phuhl\/linux_notification_center\/releases\/tag\///g')
mkdir -pv linux-notification-center/DEBIAN linux-notification-center/etc/xdg/autostart linux-notification-center/usr/bin linux-notification-center/usr/share/applications
wget -qO linux-notification-center/usr/bin/deadd-notification-center $(wget -qO- https://api.github.com/repos/phuhl/linux_notification_center/releases|grep browser_download_url|head -n1|cut -d \" -f4)
chmod +x -v linux-notification-center/usr/bin/deadd-notification-center
echo "Package: linux-notification-center
Priority: optional
Section: misc
Maintainer: Philipp Uhl <git@ph-uhl.com>
Architecture: amd64
Version: $DEADD_TAG
Homepage: https://github.com/phuhl/linux_notification_center
Description: A haskell-written notification center for users that like a desktop with style…"|tee linux-notification-center/DEBIAN/control
echo '[Desktop Entry]
Version=1.0
Name=Linux Notification Center
Comment=Central de notificações do Linux
Exec=sh -c "kill -s USR1 $(pidof deadd-notification-center)"
Icon=xfce4-notifyd
Terminal=false
StartupNotify=true
Type=Application
Categories=Settings;DesktopSettings;'|tee linux-notification-center/usr/share/applications/linux-notification-center.desktop
echo '[Desktop Entry]
Version=1.0
Name=Linux Notification Center
Exec=deadd-notification-center
Icon=xfce4-notifyd
Terminal=false
StartupNotify=true
Type=Application
Categories=Settings;DesktopSettings;'|tee linux-notification-center/etc/xdg/autostart/linux-notification-center.desktop
dpkg-deb -b linux-notification-center .
rm -rf linux-notification-center
cp linux-notification-center*.deb tmp/packages