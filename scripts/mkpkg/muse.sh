#!/bin/bash
set -e
apt-fast install -y \
    build-essential \
    cmake \
    devscripts \
    dssi-dev \
    git \
    ladspa-sdk \
    libfluidsynth-dev \
    libgtkmm-2.4-dev \
    libinstpatch-dev \
    libjack-jackd2-dev \
    liblilv-dev \
    liblo-dev \
    liblrdf0-dev \
    libqt5svg5-dev \
    librtaudio-dev \
    librubberband-dev \
    libsamplerate0-dev \
    libsndfile1-dev \
	libsratom-dev \
    libsndfile1-dev \
    lv2-dev \
    python3-dev \
    python3-pyqt5 \
    qt5-default \
    qttools5-dev \
    qttools5-dev-tools
git clone https://github.com/muse-sequencer/muse
cd muse/src
./compile_muse.sh
cd build
#sudo checkinstall ???
dpkg-buildpackage -rfakeroot -us -uc -tc
cd ../../../
mv muse/src/build/*.deb tmp/packages
rm -rfv muse*