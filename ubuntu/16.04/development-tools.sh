#!/bin/sh

# Ubuntu Development Tools

# Update Repositories
sudo apt update

# Install Ubuntu Make from PPA
sudo add-apt-repository -y ppa:ubuntu-desktop/ubuntu-make
sudo apt update
sudo apt install -y ubuntu-make

# Install Atom
umake ide atom $HOME/.local/share/umake/ide/atom

# Install IntelliJ Ultimate
umake ide idea-ultimate $HOME/.local/share/umake/ide/idea-ultimate
cp -r .IntelliJIdea* ~/

# Install Android Studio
umake android $HOME/.local/share/umake/android/android-studio --accept-license

# Install Visual Studio Code
#umake ide visual-studio-code $HOME/.local/share/umake/ide/visual-studio-code --accept-license

# Install GitKraken
./gitkraken.sh

# Install Packages
sudo apt install -y couchdb
sudo systemctl stop couchdb
sudo systemctl disable couchdb

# Install Docker
./docker.sh

# Install Angular, Ionic, and Download Source Code
./angular-ionic.sh
