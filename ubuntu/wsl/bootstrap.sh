#!/bin/sh

# Ubuntu 16.04 WSL - Bootstrap

# Set directory environment variable
DIR=$(cd `dirname $0` && pwd)

# Update packages
echo '==> Update packages? (Y/n)'
read UPDATE_PACKAGES
if [ "$UPDATE_PACKAGES" = 'y' ] || [ "$UPDATE_PACKAGES" = 'yes' ] || [ "$UPDATE_PACKAGES" = '' ]; then
    sudo apt update
    sudo apt upgrade -y
else
    echo '==> Skipping package updates.'
fi

# .bashrc modifications
echo '==> Install ~/.bashrc modifications? (Y/n)'
read BASHRC_TWEAKS
if [ "$BASHRC_TWEAKS" = 'y' ] || [ "$BASHRC_TWEAKS" = 'yes' ] || [ "$BASHRC_TWEAKS" = '' ]; then
    . $DIR/../common/bashrc-tweaks.sh
    echo 'alias code="/mnt/c/Users/Devin\ Shoemaker/code"' >> ~/.bashrc
else
    echo '==> Skipping ~/.bashrc tweaks.'
fi

# Install Node.js
echo '==> Install Node.js? (Y/n)'
read NODEJS
if [ "$NODEJS" = 'y' ] || [ "$NODEJS" = 'yes' ] || [ "$NODEJS" = '' ]; then
    . $DIR/../../common/nodejs.sh
else
    echo '==> Skipping Node.js.'
fi

# Reset directory environment variable
DIR=$(cd `dirname $0` && pwd)

# Clone Angular projects
echo '==> Clone Angular projects? (Y/n)'
read ANGULAR_PROJECTS
if [ "$ANGULAR_PROJECTS" = 'y' ] || [ "$ANGULAR_PROJECTS" = 'yes' ] || [ "$ANGULAR_PROJECTS" = '' ]; then
    . $DIR/../../common/angular-projects.sh
else
    echo '==> Skipping Angular projects.'
fi

# Clone Ionic projects
echo '==> Clone Ionic projects? (Y/n)'
read IONIC_PROJECTS
if [ "$IONIC_PROJECTS" = 'y' ] || [ "$IONIC_PROJECTS" = 'yes' ] || [ "$IONIC_PROJECTS" = '' ]; then
    . $DIR/../../common/ionic-projects.sh
else
    echo '==> Skipping Ionic projects.'
fi

# Remove packages no longer required
sudo apt autoremove -y
