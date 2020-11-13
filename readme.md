Este é o repositório `apt` do **MAD Linux**, no _indicador_ abaixo, você pode saber o status do repositório.

[![Build Status](https://img.shields.io/endpoint.svg?url=https%3A%2F%2Factions-badge.atrox.dev%2Fmyawesomedistro%2Fmadrepo%2Fbadge&style=for-the-badge&label=MAD%20Repo)](https://actions-badge.atrox.dev/myawesomedistro/madrepo/goto)

Este repositório reune pacotes de vários outros repositórios, além de pacotes que não estão disponíveis em nenhum outro repositório e também compilações próprias, feitas diretamente do código fonte.

Segue a lista:
## Espelhos

AppCenter (elementary OS)

App Grid (PPA)

AppImageLauncher (GitHub)

Apt-fast (PPA)

Crown translate (GitHub)

DockbarX (PPA)

Etcher (Apt)

Flat-remix (PPA)

Fonts Emojione (Ubuntu Focal)

Giara (PPA)

Gitify (GitHub)

GNOME ALSA mixer (Debian Stretch)

Hardcode-tray (OBS)

KXStudio (Apt) (PPA)

LinVst (GitHub)

Mailspring (GitHub)

MEGAsync (Debian Buster)

MellowPlayer (OBS)

Meteo (PPA)

NoMachine (http)

obs-v4l2sink (Repack)

OneDriver (PPA)

Papirus (PPA)

Pb-for-desktop (GitHub)

PDFsam (GitHub)

QOwnNotes (PPA)

qView (PPA)

RClone (http)

RCloneTray (GitHub)

RStudio (http)

Stremio (http)

superProductivity (GitHub)

Syncthing (Apt)

ToneLib Zoom (http)

Ubuntu Make (PPA)

WINE (Apt)

Zoom (http)

## Compilações

[Bashrun](https://gitlab.com/myawesomedistro/bashrun)

[Bit](https://github.com/chriswalz/bit)

[BSPWM](https://github.com/j-james/bspwm-rounded-corners)

[Compton](https://github.com/tryone144/compton)

[Fonts SNFS](https://github.com/supermarin/YosemiteSanFranciscoFont)

[Gestures](https://github.com/bulletmark/libinput-gestures)

[LightDM webkit2 greeter](https://github.com/Antergos/web-greeter/issues/) (OBS) (Repack) [Tema Glorious](https://github.com/manilarome/lightdm-webkit2-theme-glorious)

[Linux notification center](https://github.com/phuhl/linux_notification_center)

[LinVST3](https://github.com/osxmidi/LinVst3)

[MAD Welcome](https://gitlab.com/myawesomedistro/madwelcome)

[Panther launcher](https://gitlab.com/rastersoft/panther_launcher) (http) (Repack)

[Rambox](https://github.com/ramboxapp/community-edition) (GitHub) (Repack)

[REAPER](https://reaper.fm) (http) (Repack)

[Rofi](https://github.com/davatorium/rofi)

[Tela icon theme](https://github.com/vinceliuice/Tela-icon-theme)

[XFCE4 panel profiles](https://docs.xfce.org/apps/xfce4-panel-profiles/start) (Ubuntu focal) (Repack)

Para adicionar o repositório ao seu sistema, utilize os comandos abaixo:
```
echo 'deb https://madlinux.sourceforge.io/repo' | sudo tee /etc/apt/sources.list.d/madlinux.list
```
```
wget -qO- https://madlinux.sourceforge.io/repo/madlinux.key | gpg --dearmor | sudo tee /etc/apt/trusted.gpg.d/madlinux.gpg
```
```
sudo apt update
```

É recomendado instalar o [`apt-fast`](https://github.com/ilikenwf/apt-fast) para ter mais velocidade ao instalar pacotes deste repositório, visto que ele está hospedado gratuitamente no [**SourceForge**](https://sourceforge.net), que já é conhecido por ter uma certa _lentidão_ no **Brasil**.