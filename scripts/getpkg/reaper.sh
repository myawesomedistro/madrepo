#!/bin/bash
REAPER_VER=$(wget -qO- http://reaper.fm|grep VERSION|cut -d '>' -f2|cut -d ':' -f1|sed 's/VERSION //g')
mkdir -pv cockos-reaper/DEBIAN
echo "Package: cockos-reaper
Version: $REAPER_VER
Architecture: amd64
Maintainer: Justin Frankel <justinfrankel@reaper.fm>
Pre-depends: aria2, wget
Depends: cadence|studio-controls|qjackctl
Recommends: linvst-64bit-32bit, linvst3-64bit, winehq-staging, q4wine
Section: audio
Priority: optional
Homepage: https://reaper.fm
Description: REAPER is a complete digital audio production application for Windows and OS X, offering a full multitrack audio and MIDI recording, editing, processing, mixing and mastering toolset, REAPER supports a vast range of hardware, digital formats and plugins, and can be comprehensively extended, scripted and modified."|tee cockos-reaper/DEBIAN/control
cat <<EOF|tee cockos-reaper/DEBIAN/preinst
cd /tmp
aria2c http://reaper.fm/$(wget -qO- http://reaper.fm/download.php|grep _linux_x86_64.tar.xz|cut -d '"' -f2)
tar xf reaper*_linux_x86_64.tar.xz -C /tmp
/tmp/reaper*/install-reaper.sh --install /opt --integrate-desktop --quiet --integrate-sys-desktop
aria2c -o libSwell.colortheme http://my.opendesktop.org/s/D4GcswAieYf6Kfx/download
mv libSwell.colortheme /opt/REAPER/libSwell.colortheme|tee cockos-reaper/DEBIAN/preinst
echo "
Actions=NewProject;ShowAudioConfig;ReaMote;WhatsNew;License;
[Desktop Action NewProject]
Name=REAPER (create new project)
Name[pt_BR]=REAPER (criar novo projeto)
Exec=/opt/REAPER/reaper -new
Icon=cockos-reaper
[Desktop Action ShowAudioConfig]
Name=REAPER (show audio configuration on startup)
Name[pt_BR]=REAPER (mostrar configurações de áudio ao iniciar)
Exec=/opt/REAPER/reaper -audiocfg
Icon=cockos-reaper
[Desktop Action ReaMote]
Name=ReaMote
Exec=/opt/REAPER/reamote-server
Icon=folder-remote
[Desktop Action WhatsNew]
Name=What's new
Name[pt_BR]=O que há de novo?
Exec=xdg-open /opt/REAPER/whatsnew.txt
Icon=text-x-plain
[Desktop Action License]
Name=License and User Agreement
Name[pt_BR]=Licença e contrato de usuário
Exec=xdg-open /opt/REAPER/license.txt
Icon=text-x-plain"|tee -a /usr/share/applications/cockos-reaper.desktop
EOF
chmod +x cockos-reaper/DEBIAN/preinst
echo 'rm -rf /opt/REAPER /usr/share/applications/cockos-reaper*
find /usr/share/ -name *cockos-reaper* -delete
find /usr/share/ -name *x-reaper* -delete'|tee cockos-reaper/DEBIAN/prerm
chmod +x cockos-reaper/DEBIAN/prerm
dpkg-deb -b cockos-reaper .
cp cockos-reaper*.deb tmp/packages

#aria2c https://sws-extension.org/download/pre-release/$(wget -qO- http://sws-extension.org/download/pre-release/|grep Linux-x86_64|head -n1|cut -d '"' -f4)
#tar -xvf sws-*-Linux-x86_64-*.tar.xz -C ~/.config/REAPER
#rm -rf sws-*-Linux-x86_64-*.tar.xz
#aria2c https://stash.reaper.fm$(wget -qO- https://stash.reaper.fm/tag/Language-Packs|grep pt-BR|head -n1|cut -d '"' -f2|sed 's/\/v//g')
#mkdir -p ~/.config/REAPER/LangPack
#mv pt-BR.ReaperLangPack ~/.config/REAPER/LangPack/ -v
#aria2c $(wget -qO- https://api.github.com/repos/cfillion/reapack/releases|grep browser_download_url|grep download/v|grep x86_64.so|head -n1|cut -d '"' -f4)
#mv reaper_reapack-x86_64.so ~/.config/REAPER/UserPlugins/reaper_reapack-x86_64.so