Este é o repositório `apt` do **MAD Linux**, no _indicador_ abaixo, você pode conferir o _status_ do repositório.

[![Build Status](https://img.shields.io/endpoint.svg?url=https%3A%2F%2Factions-badge.atrox.dev%2Fmyawesomedistro%2Fmadrepo%2Fbadge%3Fref%3Dmain&style=for-the-badge&label=MAD%20Repo)](https://actions-badge.atrox.dev/myawesomedistro/madrepo/goto?ref=main)

Este repositório reune pacotes de vários outros repositórios, além de pacotes que não estão disponíveis em nenhum outro repositório e também compilações próprias, feitas diretamente do código fonte.

Segue a lista:
<details>
  <summary>Espelhos</summary>

Alva (GitHub)

Ao (GitHub)

AppCenter (elementary OS)

App Grid (PPA)

AppImageLauncher (GitHub)

Apple Music (GitHub)

Apt-fast (PPA)

Asar UI (GitHub)

Atom (Http)

Bat (GitHub)

Bomi (PPA)

Caprine (GitHub)

Cawbird (OBS)

Crown translate (GitHub)

DeltaChat (Http)

Discord (Http)

DockbarX (PPA)

Docker (Apt)

Dolibarr (SourceForge)

Draw.io (GitHub)

duf (GitHub)

Duplicati (GitHub)

Edge (Apt)

Etcher (GitHub)

Figma (GitHub)

Flat-remix (PPA)

Font Manager (PPA)

Fonts Emojione (Ubuntu Focal)

FreeTube (GitHub)

GameHub (GitHub)

gg (Apt)

ghostwriter (PPA)

Giara (PPA)

GitKraken (Http)

GitHub Desktop (GitHub)

Gitify (GitHub)

GNOME ALSA mixer (Debian Stretch)

graSSHopper (Http)

Guilded (Http)

Haguichi (PPA)

Hardcode-tray (OBS)

Heroic/Legendary (GitHub)

Hyper (Http)

Hypnotix (GitHub)

Jellyfin (Apt)

Jetbrains (Apt)

Jitsi Meet (GitHub)

KDiskMark (GitHub)

Komorebi (GitHub)

KXStudio (Apt) (PPA)

LazPaint (GitHub)

LightZone (PPA)

Linux Firmware (Apt)

Local (Http)

LSD (GitHub)

Mailspring (GitHub)

Mark Text (GitHub)

MEGAsync (Debian Buster deps)

MellowPlayer (OBS)

Meteo (PPA)

Min (GitHub)

Minio (Http)

MySQL (Apt)

Natron (PPA)

NoMachine (Http)

OneDriver (PPA)

OnlyOffice (Apt)

Papirus (PPA)

Pb-for-desktop (GitHub)

PDFsam (GitHub)

Persepolis (PPA)

PipeWire (PPA)

Portmaster (Http)

PPA-Purge (Apt)

QOwnNotes (PPA)

Quill (Http)

qView (PPA)

RClone (Http)

RCloneTray (GitHub)

RStudio (Http)

Scrcpy GUI (GitHub)

Send Anywhere (Http)

Signal (Apt)

Simplenote (GitHub)

Skype (Http)

Sleek (GitHub)

SonoBus (Apt)

SpeedTest (Apt)

Steam (Http)

Stremio (Http)

superProductivity (GitHub)

Syncthing (Apt)

SysMonTask (GitHub)

Tartube (GitHub)

Teams (Apt)

TeamViewer (Http)

ToneLib Zoom (Http)

Touchégg (GitHub)

Ubuntu Make (PPA)

Ulauncher (GitHub)

UNetbootin (PPA)

Visual Studio Code (Apt)

Vivaldi (Http)

VSCodium (GitHub)

Whale (GitHub)

WINE (Apt)

xemu (PPA)

YouTube TV Desktop (GitHub)

ZeroTier (Apt)

Zoom (Http)

</details>
<details>
  <summary>Compilações</summary>

[Advanced copy](Https://github.com/jarun/advcpmv)

[Ananicy](Https://github.com/Nefelim4ag/Ananicy)

[Apple iCloud](Https://www.addictivetips.com/ubuntu-linux-tips/use-icloud-on-linux/)

[Bashrun](Https://gitlab.com/myawesomedistro/bashrun)

[Bit](Https://github.com/chriswalz/bit)

[BSPWM](Https://github.com/j-james/bspwm-rounded-corners)

[Compton](Https://github.com/tryone144/compton)

[Fonts SNFS](Https://github.com/supermarin/YosemiteSanFranciscoFont)

[Gestures](Https://github.com/bulletmark/libinput-gestures)

[Go disk usage](Https://github.com/dundee/gdu)

[Google Docs](https://github.com/nativefier/nativefier/issues/831#issuecomment-786705198)

[LightDM webkit2 greeter](Https://github.com/Antergos/web-greeter/issues/) (OBS) (Repack) [Tema Glorious](Https://github.com/manilarome/lightdm-webkit2-theme-glorious)

[Linux notification center](Https://github.com/phuhl/linux_notification_center)

[MAD Welcome](Https://gitlab.com/myawesomedistro/madwelcome)

[Microsoft Office](https://swafox.com/msoffice-linux/)

[Obsidian](Https://github.com/obsidianmd/obsidian-releases) (GitHub) (Repack)

[Panther launcher](Https://gitlab.com/rastersoft/panther_launcher) (Http) (Repack)

[Picom](Https://github.com/jonaburg/picom)

[PowerKit](Https://github.com/rodlie/powerkit)

[Rambox](Https://github.com/ramboxapp/community-edition) (GitHub) (Repack)

[REAPER](Https://reaper.fm) (Http) (Repack)

[Rofi](Https://github.com/davatorium/rofi)

[Tela icon theme](Https://github.com/vinceliuice/Tela-icon-theme)

[Touché](Https://github.com/JoseExposito/touche)

[Warpinator](https://github.com/linuxmint/warpinator)

[XFCE4 panel profiles](Https://docs.xfce.org/apps/xfce4-panel-profiles/start) (Ubuntu focal) (Repack)

[yabridge](Https://github.com/robbert-vdh/yabridge)

[zentile](Https://github.com/blrsn/zentile)

</details>

Para adicionar este repositório ao seu sistema, utilize os comandos abaixo:
```
echo 'deb Https://sourceforge.net/projects/madlinux/files/repo core main'|sudo tee /etc/apt/sources.list.d/madlinux.list
```
```
wget -qO- Https://sourceforge.net/projects/madlinux/files/repo/madlinux.key|gpg --dearmor|sudo tee /etc/apt/trusted.gpg.d/madlinux.gpg>/dev/null
```
```
sudo apt update
```

É recomendado instalar o [`apt-fast`](Https://github.com/ilikenwf/apt-fast) para ter mais velocidade ao instalar pacotes deste repositório, visto que ele está hospedado gratuitamente no [**SourceForge**](Https://sourceforge.net), que já é conhecido por ter uma certa _lentidão_ no **Brasil**.