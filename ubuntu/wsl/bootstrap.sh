#!/bin/bash

# Ubuntu 16.04 WSL - Bootstrap

# Exit immediately if a command exits with a non-zero status
set -e

# Set directory environment variable
BOOTSTRAP_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

# Update packages
echo '==> Update packages? (Y/n)'
read UPDATE_PACKAGES
if [ "$UPDATE_PACKAGES" = 'y' ] || [ "$UPDATE_PACKAGES" = 'Y' ] || [ "$UPDATE_PACKAGES" = '' ]; then
    sudo apt update
    sudo apt -y full-upgrade
else
    echo '==> Skipping package updates.'
fi

# Install development packages
echo '==> Install development packages? GCC, Python, etc. (Y/n)'
read DEVELOPMENT_PACKAGES
if [ "$DEVELOPMENT_PACKAGES" = 'y' ] || [ "$DEVELOPMENT_PACKAGES" = 'Y' ] || [ "$DEVELOPMENT_PACKAGES" = '' ]; then
    sudo apt -y install build-essential python
else
    echo '==> Skipping development packages.'
fi

# .bashrc modifications
echo '==> Install ~/.bashrc modifications? (Y/n)'
read BASHRC_TWEAKS
if [ "$BASHRC_TWEAKS" = 'y' ] || [ "$BASHRC_TWEAKS" = 'Y' ] || [ "$BASHRC_TWEAKS" = '' ]; then
    echo 'alias code="cd /mnt/c/code"' >> ~/.bashrc
else
    echo '==> Skipping ~/.bashrc tweaks.'
fi

# Symlink SSH keys
echo '==> Symlink SSH keys? (Y/n)'
read SSH_KEYS
if [ "$SSH_KEYS" = 'y' ] || [ "$SSH_KEYS" = 'Y' ] || [ "$SSH_KEYS" = '' ]; then
    mkdir -p ~/.ssh
    ln -s /mnt/c/Users/Devin\ Shoemaker/.ssh/id_rsa ~/.ssh/id_rsa
    ln -s /mnt/c/Users/Devin\ Shoemaker/.ssh/id_rsa.pub ~/.ssh/id_rsa.pub
else
    echo '==> Skipping SSH key symlink.'
fi

# Install Node.js
echo '==> Install Node.js? (Y/n)'
read NODEJS
if [ "$NODEJS" = 'y' ] || [ "$NODEJS" = 'Y' ] || [ "$NODEJS" = '' ]; then
    . ${BOOTSTRAP_DIR}/../../common/nodejs.sh
else
    echo '==> Skipping Node.js.'
fi

# Remove packages no longer required
sudo apt -y autoremove
