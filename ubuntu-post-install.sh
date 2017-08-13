#!/bin/sh

# Ubuntu 17.04 Post Install Script

# Update Packages
sudo apt -y update &&
sudo apt -y upgrade

# Install NVIDIA Driver
sudo ubuntu-drivers autoinstall

# Install User Applications
sudo apt -y install gnome-boxes gparted guake pulseaudio-equalizer virtualbox xclip

# Install GNOME Shell Extensions
sudo apt -y install gnome-shell-extension-dashtodock gnome-shell-extension-top-icons-plus
gnome-shell-extension-tool -e dashtodock
gnome-shell-extension-tool -e top-icons-plus

# Install Development Tools
sudo apt -y install couchdb

# Install Ubuntu Make from PPA
sudo add-apt-repository -y ppa:ubuntu-desktop/ubuntu-make
sudo apt update
sudo apt -y install ubuntu-make

# Install IntelliJ Ultimate
umake ide idea-ultimate
cp -r .IntelliJIdea* ~/

# Install Android Studio
umake android --accept-license

# Install Visual Studio Code
umake ide visual-studio-code --accept-license

# Install Google Chrome
./ubuntu-install-chrome.sh

# Install GitKraken
./ubuntu-install-gitkraken.sh

# Install Arc Theme
sudo add-apt-repository -y ppa:noobslab/icons &&
sudo apt -y update &&
sudo apt -y install arc-theme arc-icons

# Install Paper Theme
sudo add-apt-repository -y ppa:snwh/pulp &&
sudo apt -y update &&
sudo apt -y install paper-gtk-theme paper-icon-theme

# Update Packages
sudo apt -y update &&
sudo apt -y upgrade

# Remove Packages No Longer Required
sudo apt -y autoremove

# Install Ionic and Download Source Code
sudo apt -y install curl
curl -sL https://deb.nodesource.com/setup_6.x | sudo bash -
sudo apt -y install nodejs
sudo npm install -g ionic cordova
mkdir -p ~/code/ionic
cd ~/code/ionic
git clone https://github.com/dshoe/taskit-ionic.git
sudo npm install -g add-cors-to-couchdb
add-cors-to-couchdb
git clone https://github.com/dshoe/coinbase-profit.git

# Fix Equalizer
sudo passwd root
su -c 'echo load-module module-equalizer-sink  >> /etc/pulse/default.pa
echo load-module module-dbus-protocol >> /etc/pulse/default.pa'
