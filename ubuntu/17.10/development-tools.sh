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
./../../common/nodejs.sh

# Install Angular and Download Source Code
./../common/angular.sh

# Install Ionic and Download Source Code
./../common/ionic.sh

# Install Ubuntu Make
./../common/ubuntu-make.sh

# Install Android Studio
./../common/android-studio.sh
