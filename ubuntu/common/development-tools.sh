#!/bin/sh

# Ubuntu - Development Tools

# Update Repositories
sudo apt update

# Install Snap Packages
./../../common/development-snaps.sh

# Install GitKraken
./../common/gitkraken.sh

# Install Docker
./../common/docker.sh

# Install Node.js
./../../common/nodejs.sh

# Install Angular
./../../common/angular.sh

# Clone Angular Projects
./../../common/angular-projects.sh

# Install Ionic
./../../common/ionic.sh

# Clone Ionic Projects
./../../common/ionic-projects.sh

# Install Ubuntu Make
./../common/ubuntu-make.sh

# Install Android Studio
./../common/android-studio.sh
