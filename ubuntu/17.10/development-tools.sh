#!/bin/sh

# Ubuntu 17.10 Development Tools

# Update Repositories
sudo apt update

# Install Snap Packages
./../common/development-snaps.sh

# Install GitKraken
./../common/gitkraken.sh

# Install Docker
./../common/docker.sh

# Install Node.js
./../common/nodejs.sh

# Install Angular, Ionic, and Download Source Code
./../common/angular-ionic.sh

# Install Ubuntu Make from PPA
sudo add-apt-repository -y ppa:lyzardking/ubuntu-make
sudo apt update
sudo apt install -y ubuntu-make

# Install Android Studio
umake android $HOME/.local/share/umake/android/android-studio --accept-license
echo 'export ANDROID_HOME=~/Android/Sdk' >> ~/.bashrc
echo 'export PATH=$PATH:~/Android/Sdk/platform-tools' >> ~/.bashrc
sudo apt install -y gradle
