#!/bin/bash
mkdir -pv tmp/packages
sudo apt install -y checkinstall

# Tela icon theme
TELA_TAG=$(wget -qO- https://api.github.com/repos/vinceliuice/Tela-icon-theme/releases|grep tag|head -n1|cut -d \" -f4|sed 's/https:\/\/github.com\/vinceliuice\/Tela-icon-theme\/releases\/tag\///g')
git clone https://github.com/vinceliuice/Tela-icon-theme
cd Tela-icon-theme/
sudo ./install.sh -a
cd ..
rm -rf Tela-icon-theme
sudo sed -i 's/hicolor/Papirus/g' /usr/share/icons/Tela*/index.theme
sudo sed -i 's/Papirus/Papirus-Dark/g' /usr/share/icons/Tela*-dark*/index.theme
mkdir -pv tela-icon-theme/DEBIAN tela-icon-theme/usr/share/icons
echo "Package: tela-icon-theme
Priority: optional
Section: misc
Maintainer: VinceLiuice <vinceliuice@hotmail.com>
Architecture: all
Version: $TELA_TAG
Depends: hicolor-icon-theme, papirus-icon-theme
Homepage: https://github.com/vinceliuice/Tela-icon-theme
Description: A flat colorful design icon theme for linux desktops"|tee tela-icon-theme/DEBIAN/control
echo '#!/bin/sh
set -e

if [ "$1" = "configure" ]||[ "$1" = "abort-upgrade" ]||[ "$1" = "abort-deconfigure" ]||[ "$1" = "abort-remove" ] ; then
	if which update-icon-caches >/dev/null 2>&1 ; then
		update-icon-caches /usr/share/icons/Tela /usr/share/icons/Tela-dark
	fi
fi'|tee tela-icon-theme/DEBIAN/postinst
echo '#!/bin/sh
set -e

if which update-icon-caches >/dev/null 2>&1 ; then
	update-icon-caches /usr/share/icons/Tela /usr/share/icons/Tela-dark
fi'|tee tela-icon-theme/DEBIAN/postrm
chmod +x -v tela-icon-theme/DEBIAN/post*
cp -rf /usr/share/icons/Tela* tela-icon-theme/usr/share/icons/
dpkg-deb -b tela-icon-theme .
rm -rf tela-icon-theme
cp tela-icon-theme*.deb tmp/packages

# Linux notification center
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
rm -rfv linux-notification-center
cp linux-notification-center*.deb tmp/packages

# Panther Launcher
wget -q https://rastersoft.com/descargas/panther_launcher/panther-launcher-sid_1.12.0-debian1_amd64.deb
dpkg-deb -xv panther-launcher-sid_1.12.0-debian1_amd64.deb panther-launcher
rm -rfv panther-launcher/etc/xdg/menus/panther-applications.menu
ln -sv /etc/xdg/menus/xfce-applications.menu panther-launcher/etc/xdg/menus/panther-applications.menu
cp -rfv assets/org.rastersoft.panther* panther-launcher/usr/share/glib-2.0/schemas/
mkdir -pv panther-launcher/DEBIAN panther-launcher/etc/apt/apt.conf.d/
cp -rfv assets/100xfce-entries panther-launcher/etc/apt/apt.conf.d/100xfce-entries
dpkg-deb -e panther-launcher-sid_1.12.0-debian1_amd64.deb panther-launcher/DEBIAN
rm -rfv panther-launcher*.deb
dpkg-deb -b panther-launcher .
rm -rfv panther-launcher
cp panther-launcher*.deb tmp/packages

# XFCE panel profiles
wget -q http://mirrors.kernel.org/ubuntu/pool/universe/x/xfce4-panel-profiles/$(wget -qO- http://mirrors.kernel.org/ubuntu/pool/universe/x/xfce4-panel-profiles/|grep all.deb|head -n1|cut -d \" -f2)
dpkg-deb -xv xfce4-panel-profiles_1.0.10-0ubuntu1_all.deb xfce4-panel-profiles
rm -rfv xfce4-panel-profiles/usr/share/xfce4-panel-profiles/layouts/*
cp -rfv assets/*.tar.bz2 xfce4-panel-profiles/usr/share/xfce4-panel-profiles/layouts/
dpkg-deb -e xfce4-panel-profiles*.deb xfce4-panel-profiles/DEBIAN
rm -rfv xfce4-panel-profiles*.deb
dpkg-deb -b xfce4-panel-profiles .
rm -rfv xfce4-panel-profiles
cp xfce4-panel-profiles*.deb tmp/packages

# Compton
sudo apt install -y \
  libx11-dev \
  libxcomposite-dev \
  libxdamage-dev \
  libxrender-dev \
  libxrandr-dev \
  libxinerama-dev \
  libconfig-dev \
  libdbus-1-dev libdrm-dev \
  libgl1-mesa-dev \
  libpcre3-dev
git clone https://github.com/tryone144/compton
cd compton
make
sudo apt install -y --no-install-recommends \
  asciidoc \
  docbook-xml \
  xsltproc \
  xmlto
make docs
sudo checkinstall -D -y \
  --install=no \
  --maintainer tryone144@github.com \
  --pkgversion `echo $(git describe --always --dirty)-$(git log -1 --date=short --pretty=format:%cd)|sed 's/v//g'|sed 's/_/-/g'` \
  --requires libconfig9
cd ..
cp compton/compton*.deb tmp/packages

# SanFranciso
YOSEMITE_VERSION=`echo $(wget -qO- https://api.github.com/repos/supermarin/YosemiteSanFranciscoFont/commits/master|grep date|head -n 1|cut -d \" -f4|cut -d \: -f1|cut -d \T -f1)`
mkdir -pv fonts-sfns/DEBIAN
git clone https://github.com/supermarin/YosemiteSanFranciscoFont
echo "Package: fonts-sfns
Version: $YOSEMITE_VERSION
Architecture: all
Maintainer: Marin <supermarin@github.com>
Section: fonts
Priority: optional
Multi-Arch: foreign
Homepage: https://github.com/supermarin/YosemiteSanFranciscoFont
Description: The font is adapted from San Francisco – Apple’s new typeface for the Apple Watch. This project was inspired by jenskutilek’s Fira System Font Replacement. The fonts were generated using dtinth's Yosemite System Font Patcher."|tee fonts-sfns/DEBIAN/control
mkdir -pv fonts-sfns/usr/share/fonts/YosemiteSanFranciscoFont/
mv YosemiteSanFranciscoFont/*.ttf fonts-sfns/usr/share/fonts/YosemiteSanFranciscoFont/
rm -rfv YosemiteSanFranciscoFont
dpkg-deb -b fonts-sfns .
rm fonts-sfns
cp fonts-sfns*.deb tmp/packages

# Rambox
wget -q $(wget -qO- https://api.github.com/repos/ramboxapp/community-edition/releases|grep browser_download_url|grep amd64.deb|head -n1|cut -d \" -f4)
dpkg-deb -xv Rambox*.deb rambox
dpkg-deb -e Rambox*.deb rambox/DEBIAN
rm -rfv Rambox*.deb
npx asar e rambox/opt/Rambox/resources/app.asar app-rambox
echo '
/**
 * Dark background
 */
.x-tab {
  background-color: #000000
}
.x-tab:hover {
  background-color: #090909
}
.x-tab-bar-body {
  background-color: #000000
}
.x-tab.x-tab-active.x-tab-default {
  border-color: white;
  background-color: #090909
}' >> app-rambox/resources/Rambox-all.css
npx asar p app-rambox app.asar
cp -rfv app.asar rambox/opt/Rambox/resources/app.asar
rm -rfv app app.asar app-rambox
dpkg-deb -b rambox .
cp rambox*.deb tmp/packages

# LightDM webkit greeter
GLORIOUS_TAG=$(wget -qO- https://api.github.com/repos/manilarome/lightdm-webkit2-theme-glorious/releases|grep tag|head -n1|cut -d \" -f4|sed 's/https:\/\/github.com\/manilarome\/lightdm-webkit2-theme-glorious\/releases\/tag\///g')
wget -q https://download.opensuse.org/repositories/home:/antergos/xUbuntu_17.10/amd64/lightdm-webkit2-greeter_2.2.5-1+15.31_amd64.deb
dpkg-deb -xv lightdm-webkit2-greeter*.deb lightdm-webkit2-greeter
dpkg-deb -e lightdm-webkit2-greeter*.deb lightdm-webkit2-greeter/DEBIAN
rm lightdm-webkit2-greeter*.deb lightdm-webkit2-greeter/DEBIAN/md5sums
git clone https://github.com/manilarome/lightdm-webkit2-theme-glorious lightdm-webkit2-greeter/usr/share/lightdm-webkit/themes/glorious
mkdir -pv lightdm-webkit2-greeter/etc/lightdm/lightdm.conf.d
echo '[Seat:*]
greeter-session=lightdm-webkit2-greeter'|tee lightdm-webkit2-greeter/etc/lightdm/lightdm.conf.d/50-lightdm-webkit2-greeter.conf
sed -i 's/antergos/glorious/g' lightdm-webkit2-greeter/etc/lightdm/lightdm-webkit2-greeter.conf
sed -i 's/background_images = \/usr\/share\/backgrounds/background_images = \/usr\/share\/xfce4\/backdrops/g' lightdm-webkit2-greeter/etc/lightdm/lightdm-webkit2-greeter.conf
echo sed -i 's/greeter-session=lightdm-/#greeter-session=lightdm-/g' /etc/lightdm/lightdm.conf|tee lightdm-webkit2-greeter/DEBIAN/postinst
echo sed -i 's/#greeter-session=lightdm-/greeter-session=lightdm-/g' /etc/lightdm/lightdm.conf|tee lightdm-webkit2-greeter/DEBIAN/postrm
chmod +x -v lightdm-webkit2-greeter/DEBIAN/post*
sed -i "s/2.2.5-1+15.31/2.2.5-1+15.31-glorious-$GLORIOUS_TAG/g" lightdm-webkit2-greeter/DEBIAN/control
dpkg-deb -b lightdm-webkit2-greeter .
rm -rfv lightdm-webkit2-greeter
cp lightdm-webkit2-greeter*.deb tmp/packages

# LinVst3
LINVST_TAG=$(wget -qO- https://api.github.com/repos/osxmidi/LinVst3/releases|grep tag|head -n1|cut -d \" -f4|sed 's/https:\/\/github.com\/osxmidi\/LinVst3\/releases\/tag\///g')
wget $(wget -qO- https://api.github.com/repos/osxmidi/LinVst3/releases|grep browser_download_url|grep .zip|head -n1|cut -d \" -f4)
unzip LinVst*.zip
rm -rv LinVst3*.zip
mkdir -pv linvst3/DEBIAN linvst3/usr/bin linvst3/usr/share/LinVst/64bit-32bit
rm -rfv LinVst3*/convert/ReadMe
cp -rfv LinVst3*/convert/* linvst3/usr/bin/
mv -v LinVst3*/embedded/linvst3.so linvst3/usr/share/LinVst/64bit-32bit/
cp -rfv LinVst3-2.15/embedded/* linvst3/usr/bin/
echo "Package: linvst3-64bit-32bit
Version: $LINVST_TAG
Section: audio
Priority: optional
Architecture: amd64
Maintainer: abc@def.com
Description: Linux Wrapper for 64 bit and 32 bit windows VST3 plugins. See Readme in /usr/share/LinVst."|tee linvst3/DEBIAN/control
rm -rfv LinVst3*
dpkg-deb -b linvst3 .
rm -rfv linvst3
cp linvst3*.deb tmp/packages

# BSPWM
sudo apt install -y \
	libxcb-icccm4-dev \
	libxcb-xinerama0-dev \
	libxcb-randr0-dev \
	libxcb-util0-dev \
	libxcb-ewmh-dev \
	libxcb-keysyms1-dev \
	libxcb-shape0-dev
#git clone https://github.com/baskerville/bspwm
git clone https://github.com/j-james/bspwm-rounded-corners
cd bspwm-rounded-corners
sed -i 's/usr\/local/usr/g' Makefile
make
sudo checkinstall -y \
	--install=no \
	--maintainer rauldipeas@mail.com \
	--pkgname 'bspwm' \
	--pkgversion `cat VERSION` \
  --pkgrelease '4' \
	--requires 'libxcb-ewmh2, libxcb-util1' \
	--provides 'bspwm'
cd ..
cp bspwm-rounded-corners/bspwm*.deb tmp/packages
wget -q http://mirrors.kernel.org/ubuntu/pool/main/x/xcb-util/$(wget -qO- http://mirrors.kernel.org/ubuntu/pool/main/x/xcb-util/|grep amd64.deb|grep libxcb-util1|head -n1|cut -d \" -f2)
cp libxcb-util*.deb tmp/packages

# Gestures
sudo apt install -y libinput-tools
git clone https://github.com/bulletmark/libinput-gestures.git
cd libinput-gestures
sed -i 's/\/usr\/share\/applications/\/etc\/xdg\/autostart/g' libinput-gestures-setup
sed -i 's/update-desktop-database/#update-desktop-database/g' libinput-gestures-setup
sed -i 's/NoDisplay=true/NoDisplay=false/g' libinput-gestures.desktop
sudo checkinstall -D -y \
    --install=no \
    --maintainer bulletmark@github.com \
    --pkgname libinput-gestures \
    --pkgversion `./list-version-hashes | tail -1 | awk '{print $1}'` \
    --provides libinput-gestures
cd ..
cp libinput-gestures/libinput-gestures*.deb tmp/packages