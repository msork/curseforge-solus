#!/bin/bash
# VARIABLES
FILE="cider-v3.0.0-linux-x64.deb"

# SETUP DIRECTORIES
sudo rm -rf ~/Downloads/cider-updater
mkdir -p ~/Downloads/cider-updater
cd ~/Downloads/cider-updater

# DOWNLOAD DEB AND EXTRACT VERSION
wget 'https://repo.cider.sh/apt/pool/main/'$FILE -O $FILE.deb
ar xf $FILE
tar --zstd -xvf control.tar.zst
VERSION=$(sed -n 2p control | grep -Po '(?<=Version: )\S+')
rm debian-binary data.tar.zst control control.tar.zst $FILE

# COPY SCRIPT AND FILES
wget 'https://raw.githubusercontent.com/msork/my-3rdparty-solus/refs/heads/master/scripts/ep-update.py' -O ep-update.py
wget 'https://raw.githubusercontent.com/msork/my-3rdparty-solus/refs/heads/master/multimedia/music/cider/actions.py' -O actions.py
wget 'https://raw.githubusercontent.com/msork/my-3rdparty-solus/refs/heads/master/multimedia/music/cider/pspec.xml' -O pspec.xml

# RUN SCRIPT
chmod +x ep-update.py
./ep-update.py $VERSION https://repo.cider.sh/apt/pool/main/$FILE

# BUILD AND INSTALL EOPKG
sudo eopkg bi --ignore-safety pspec.xml
sudo eopkg it -y ./*.eopkg

# REMOVE FILES
sudo rm -rf ~/Downloads/cider-updater
sudo rm ~/Downloads/cider-updater/cider-*.eopkg
