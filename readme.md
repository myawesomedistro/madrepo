Este é o repositório `apt` do **MAD Linux**, no _indicador_ abaixo, você pode conferir o _status_ do repositório.

[![Build Status](https://img.shields.io/endpoint.svg?url=https%3A%2F%2Factions-badge.atrox.dev%2Fmyawesomedistro%2Fmadrepo%2Fbadge&style=for-the-badge&label=MAD%20Repo)](https://actions-badge.atrox.dev/myawesomedistro/madrepo/goto)

Este repositório reune pacotes de vários outros repositórios, além de pacotes que não estão disponíveis em nenhum outro repositório e também compilações próprias, feitas diretamente do código fonte.

Segue a lista:
## Espelhos

AppCenter (elementary OS)

App Grid (PPA)

AppImageLauncher (GitHub)

Apt-fast (PPA)

Bat (GitHub)

Crown translate (GitHub)

DockbarX (PPA)

Etcher (Apt)

Evernote (http)

Flat-remix (PPA)

Font Manager (PPA)

Fonts Emojione (Ubuntu Focal)

FreeTube (GitHub)

GameHub (GitHub)

gg (Apt)

Giara (PPA)

GitHub Desktop (GitHub)

Gitify (GitHub)

GNOME ALSA mixer (Debian Stretch)

Haguichi (PPA)

Hardcode-tray (OBS)

Heroic/Legendary (GitHub)

Hypnotix (GitHub)

KXStudio (Apt) (PPA)

LazPaint (GitHub)

Lightworks (http)

Linux Firmware (Apt)

LinVST (GitHub)

Mailspring (GitHub)

MEGAsync (Debian Buster deps)

MellowPlayer (OBS)

Meteo (PPA)

Min (GitHub)

Minio (http)

NoMachine (http)

obs-v4l2sink (Repack)

OneDriver (PPA)

OnlyOffice (Apt)

Papirus (PPA)

Pb-for-desktop (GitHub)

PDFsam (GitHub)

Persepolis (PPA)

QOwnNotes (PPA)

qView (PPA)

RClone (http)

RCloneTray (GitHub)

RStudio (http)

Signal (Apt)

Simplenote (GitHub)

Skype (http)

Slack (http)

SonoBus (Apt)

SpeedTest (Apt)

Steam (http)

Stremio (http)

superProductivity (GitHub)

Syncthing (Apt)

Tartube (GitHub)

TeamViewer (http)

ToneLib Zoom (http)

Touchégg (GitHub)

Ubuntu Make (PPA)

UNetbootin (PPA)

WINE (Apt)

ZeroTier (Apt)

Zoom (http)

## Compilações

[Advanced copy](https://github.com/jarun/advcpmv)

[Bashrun](https://gitlab.com/myawesomedistro/bashrun)

[Bit](https://github.com/chriswalz/bit)

[BSPWM](https://github.com/j-james/bspwm-rounded-corners)

[Compton](https://github.com/tryone144/compton)

[Fonts SNFS](https://github.com/supermarin/YosemiteSanFranciscoFont)

[Gestures](https://github.com/bulletmark/libinput-gestures)

[Go disk usage](https://github.com/dundee/gdu)

[LightDM webkit2 greeter](https://github.com/Antergos/web-greeter/issues/) (OBS) (Repack) [Tema Glorious](https://github.com/manilarome/lightdm-webkit2-theme-glorious)

[Linux notification center](https://github.com/phuhl/linux_notification_center)

[LinVST3](https://github.com/osxmidi/LinVst3)

[MAD Welcome](https://gitlab.com/myawesomedistro/madwelcome)

[Obsidian](https://github.com/obsidianmd/obsidian-releases) (GitHub) (Repack)

[Panther launcher](https://gitlab.com/rastersoft/panther_launcher) (http) (Repack)

[Picom](https://github.com/jonaburg/picom)

[PowerKit](https://github.com/rodlie/powerkit)

[Rambox](https://github.com/ramboxapp/community-edition) (GitHub) (Repack)

[REAPER](https://reaper.fm) (http) (Repack)

[Rofi](https://github.com/davatorium/rofi)

[Tela icon theme](https://github.com/vinceliuice/Tela-icon-theme)

[Touché](https://github.com/JoseExposito/touche)

[XFCE4 panel profiles](https://docs.xfce.org/apps/xfce4-panel-profiles/start) (Ubuntu focal) (Repack)

[yabridge](https://github.com/robbert-vdh/yabridge)

[zentile](https://github.com/blrsn/zentile)

Para adicionar este repositório ao seu sistema, utilize os comandos abaixo:
```
echo 'deb https://sourceforge.net/projects/madlinux/files/repo core main'|sudo tee /etc/apt/sources.list.d/madlinux.list
```
```
wget -qO- https://sourceforge.net/projects/madlinux/files/repo/madlinux.key|gpg --dearmor|sudo tee /etc/apt/trusted.gpg.d/madlinux.gpg
```
```
sudo apt update
```

É recomendado instalar o [`apt-fast`](https://github.com/ilikenwf/apt-fast) para ter mais velocidade ao instalar pacotes deste repositório, visto que ele está hospedado gratuitamente no [**SourceForge**](https://sourceforge.net), que já é conhecido por ter uma certa _lentidão_ no **Brasil**.