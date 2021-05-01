#!/bin/bash
set -e
MUSE_TAG=$(curl -su $GAPI_AUTH https://api.github.com/repos/muse-sequencer/muse/releases|grep tag_name|head -n2|tail -n1|cut -d '"' -f4|sed 's/https:\/\/github.com\/muse-sequencer\/muse\/releases\/tag\///g')
apt-fast install -y \
    build-essential \
    cmake \
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
#sed -i "s/Architecture: amd64/Architecture: amd64\nSection: audio/g" packaging/ubuntu/DEBIAN/control
#sed -i 's/Depends: python3/Depends: python3, libpython3.8, libgtkmm-2.4-1v5/g' packaging/ubuntu/DEBIAN/control
#sed -i "s/3.1/$MUSE_TAG/g" packaging/ubuntu/DEBIAN/control
#sed -i 's/muse3/muse4/g' packaging/ubuntu/DEBIAN/control
#sed -i 's/muse4master/muse/g' packaging/ubuntu/DEBIAN/control
#sed -i 's/..\/packaging\/org.musesequencer.Muse3.png/..\/packaging\/muse64x64.png/g' packaging/ubuntu/build_ubuntu_debian_package.sh
#sed -i 's/muse3/muse4/g' packaging/ubuntu/build_ubuntu_debian_package.sh
#sed -i 's/Muse3/Muse4/g' packaging/ubuntu/build_ubuntu_debian_package.sh
#sudo bash packaging/ubuntu/build_ubuntu_debian_package.sh
mkdir build
cd build
cmake -DCMAKE_BUILD_TYPE=release -DCMAKE_INSTALL_PREFIX=/opt/muse-sequencer.github.io ..
make
sudo make install
mkdir -p muse/opt/muse-sequencer.github.io
mkdir -p muse/usr/bin
mkdir -p muse/usr/applications
mkdir -p muse/usr/icons
ln -s /opt/muse-sequencer.github.io/bin/muse4 muse/usr/bin/muse4
sed -i "s/Architecture: amd64/Architecture: amd64\nSection: audio/g" ../packaging/ubuntu/DEBIAN/control
sed -i 's/Depends: python3/Depends: python3, libpython3.8, libgtkmm-2.4-1v5/g' ../packaging/ubuntu/DEBIAN/control
sed -i "s/Version: 3.1master/Version: $MUSE_TAG/g" ../packaging/ubuntu/DEBIAN/control
sed -i 's/muse3/muse4/g' ../packaging/ubuntu/DEBIAN/control
sed -i 's/muse4master/muse/g' ../packaging/ubuntu/DEBIAN/control
cp -r ../packaging/ubuntu/DEBIAN muse/
cp -r /opt/muse-sequencer.github.io muse/opt/
cp packaging/org.musesequencer.Muse4.desktop.in muse/usr/applications/org.musesequencer.Muse4.desktop
cp ../packaging/64x64.png muse/usr/pixmaps/muse.png
dpkg-deb --build muse
cd ../../
find ./muse -name "muse*.deb" -exec cp -v {} tmp/packages \;
sudo rm -rfv muse*