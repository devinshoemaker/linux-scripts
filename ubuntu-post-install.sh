#!/bin/sh

# Ubuntu 16.04/17.04 Post Install Script

# Update Packages
sudo apt -y update &&
sudo apt -y upgrade

# Install User Applications
sudo apt -y install gparted guake pulseaudio-equalizer xclip

# Install GNOME Shell Extensions
sudo apt -y install gnome-shell-extension-dashtodock gnome-shell-extension-top-icons-plus
gnome-shell-extension-tool -e dashtodock
gnome-shell-extension-tool -e top-icons-plus

# Install Development Tools
sudo apt -y install couchdb ubuntu-make

# Install IntelliJ Ultimate
umake ide idea-ultimate
cp -r .IntelliJIdea* ~/

# Install Visual Studio Code
umake ide visual-studio-code --accept-license

# Install Google Chrome
wget -q -O - https://dl-ssl.google.com/linux/linux_signing_key.pub | sudo apt-key add - &&
sudo sh -c 'echo "deb [arch=amd64] http://dl.google.com/linux/chrome/deb/ stable main" >> /etc/apt/sources.list.d/google.list' &&
sudo apt -y update &&
sudo apt -y install google-chrome-stable

# Install GitKraken
wget https://release.gitkraken.com/linux/gitkraken-amd64.deb &&
sudo dpkg -i gitkraken-amd64.deb &&
rm gitkraken-amd64.deb

# Install Paper Icon Theme
sudo add-apt-repository -y ppa:snwh/pulp &&
sudo apt -y update &&
sudo apt -y install paper-gtk-theme paper-icon-theme

# Update Packages
sudo apt -y update &&
sudo apt -y upgrade

# Remove Packages No Longer Required
sudo apt -y autoremove
