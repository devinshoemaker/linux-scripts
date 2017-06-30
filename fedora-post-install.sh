#!/bin/sh

# Fedora 25 Post Install Script

# Give User the Wheel
# Run First Manually
# su
# usermod -a -G wheel dshoemaker

# Repos

## Google Chrome
sudo cat << EOF > /etc/yum.repos.d/google-chrome.repo
[google-chrome]
name=google-chrome - \$basearch
baseurl=http://dl.google.com/linux/chrome/rpm/stable/\$basearch
enabled=1
gpgcheck=1
gpgkey=https://dl-ssl.google.com/linux/linux_signing_key.pub
EOF

## Configure RPMFusion repository
su -c 'dnf install http://download1.rpmfusion.org/free/fedora/rpmfusion-free-release-$(rpm -E %fedora).noarch.rpm http://download1.rpmfusion.org/nonfree/fedora/rpmfusion-nonfree-release-$(rpm -E %fedora).noarch.rpm'

## Atom
sudo dnf copr enable mosquito/atom

## Visual Studio Code
sudo dnf copr enable mosquito/vscode

## Arc theme
sudo dnf copr enable user501254/Arc

## Spotify
sudo dnf config-manager --add-repo=http://negativo17.org/repos/fedora-spotify.repo

## Flash plugin
sudo rpm -ivh http://linuxdownload.adobe.com/adobe-release/adobe-release-i386-1.0-1.noarch.rpm
sudo rpm --import /etc/pki/rpm-gpg/RPM-GPG-KEY-adobe-linux

# Update Packages
sudo dnf check-update
sudo dnf upgrade

# Install media codecs
sudo dnf install gstreamer-plugins-bad gstreamer-plugins-bad-free-extras gstreamer-plugins-bad-nonfree gstreamer-plugins-ugly gstreamer-ffmpeg gstreamer1-libav gstreamer1-plugins-bad-free-extras gstreamer1-plugins-bad-freeworld gstreamer1-plugins-base-tools gstreamer1-plugins-good-extras gstreamer1-plugins-ugly gstreamer1-plugins-bad-free gstreamer1-plugins-good gstreamer1-plugins-base gstreamer1

# Install user applications
sudo dnf install arc-theme-solid arc-icon-theme flash-plugin alsa-plugins-pulseaudio libcurl fuse-exfat gnome-tweak-tool google-chrome-stable gparted guake nano pulseaudio-equalizer simple-scan spotify

# Install GNOME extensions
sudo dnf install gnome-shell-extension-no-topleft-hot-corner gnome-shell-extension-simple-dock gnome-shell-extension-topicons-plus

# Install development tools
sudo dnf install atom couchdb vscode
sudo systemctl start couchdb.service
sudo systemctl enable couchdb.service

# Install IntelliJ Ultimate
./fedora-install-intellij.sh

# Install GitKraken
./fedora-install-gitkraken.sh

# .bashrc
echo export EDITOR=nano >> ~/.bashrc

# Download source code

## Ionic
sudo npm install -g ionic cordova
mkdir -p ~/Code/ionic
cd ~/Code/ionic 
git clone https://github.com/dshoe/taskit-ionic.git 
sudo npm install -g add-cors-to-couchdb
add-cors-to-couchdb
