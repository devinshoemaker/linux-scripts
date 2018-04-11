#!/bin/bash

# Ubuntu 16.04 WSL - Bootstrap

# Exit immediately if a command exits with a non-zero status
set -e

# Set directory environment variable
BOOTSTRAP_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

# Update packages
echo '==> Update packages? (Y/n)'
read UPDATE_PACKAGES
if [ "$UPDATE_PACKAGES" = 'y' ] || [ "$UPDATE_PACKAGES" = 'yes' ] || [ "$UPDATE_PACKAGES" = '' ]; then
    sudo apt update
    sudo apt -y upgrade
else
    echo '==> Skipping package updates.'
fi

# .bashrc modifications
echo '==> Install ~/.bashrc modifications? (Y/n)'
read BASHRC_TWEAKS
if [ "$BASHRC_TWEAKS" = 'y' ] || [ "$BASHRC_TWEAKS" = 'yes' ] || [ "$BASHRC_TWEAKS" = '' ]; then
    echo 'cd alias code="/mnt/c/code"' >> ~/.bashrc
else
    echo '==> Skipping ~/.bashrc tweaks.'
fi

# Symlink SSH keys
echo '==> Symlink SSH keys? (Y/n)'
read SSH_KEYS
if [ "$SSH_KEYS" = 'y' ] || [ "$SSH_KEYS" = 'yes' ] || [ "$SSH_KEYS" = '' ]; then
    mkdir -p ~/.ssh
    ln -s /mnt/c/Users/Devin\ Shoemaker/.ssh/id_rsa ~/.ssh/id_rsa
    ln -s /mnt/c/Users/Devin\ Shoemaker/.ssh/id_rsa.pub ~/.ssh/id_rsa.pub
else
    echo '==> Skipping SSH key symlink.'
fi

# Install Node.js
echo '==> Install Node.js? (Y/n)'
read NODEJS
if [ "$NODEJS" = 'y' ] || [ "$NODEJS" = 'yes' ] || [ "$NODEJS" = '' ]; then
    . ${BOOTSTRAP_DIR}/../../common/nodejs.sh
else
    echo '==> Skipping Node.js.'
fi

# Remove packages no longer required
sudo apt -y autoremove
