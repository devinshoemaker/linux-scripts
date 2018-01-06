#!/bin/sh

# Ubuntu Development Tools

# Update Repositories
sudo apt update

# Install Snap Packages
./../common/snaps.sh

# Install GitKraken
./../common/gitkraken.sh

# Install Docker
./../common/docker.sh

# Install Angular, Ionic, and Download Source Code
./../common/angular-ionic.sh

# Install Ubuntu Make from PPA
# sudo add-apt-repository -y ppa:ubuntu-desktop/ubuntu-make
# sudo apt update
# sudo apt install -y ubuntu-make
sudo snap install ubuntu-make --classic

# Install Android Studio
ubuntu-make.umake android $HOME/.local/share/umake/android/android-studio --accept-license

# Install Atom
# umake ide atom $HOME/.local/share/umake/ide/atom

# Install IntelliJ Ultimate
# umake ide idea-ultimate $HOME/.local/share/umake/ide/idea-ultimate
# cp -r ../../.IntelliJIdea* ~/

# Install Visual Studio Code
# umake ide visual-studio-code $HOME/.local/share/umake/ide/visual-studio-code --accept-license

# Install Packages
# sudo apt install -y couchdb
