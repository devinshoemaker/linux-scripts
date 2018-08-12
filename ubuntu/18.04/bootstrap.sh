#!/bin/bash

# Ubuntu 18.04 - Bootstrap

# Exit immediately if a command exits with a non-zero status
set -e

# Update the user's cached credentials, authenticating the user if necessary
sudo -v

# Store a local variable of the scripts current directory
UBUNTU_1804_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

# Update packages
echo '==> Update packages? (Y/n)'
read USER_PROMPT
if [ "$USER_PROMPT" = 'y' ] || [ "$USER_PROMPT" = 'Y' ] || [ "$USER_PROMPT" = '' ]; then
    sudo apt update
    sudo apt -y full-upgrade
else
    echo '==> Skipping package updates.'
fi

# Set root password
echo '==> Set root password? (Y/n)'
read USER_PROMPT
if [ "$USER_PROMPT" = 'y' ] || [ "$USER_PROMPT" = 'Y' ] || [ "$USER_PROMPT" = '' ]; then
    sudo passwd root
else
    echo '==> Skipping root password.'
fi

# GRUB tweaks
echo '==> Install GRUB tweaks? (Y/n)'
read USER_PROMPT
if [ "$USER_PROMPT" = 'y' ] || [ "$USER_PROMPT" = 'Y' ] || [ "$USER_PROMPT" = '' ]; then
    . ${UBUNTU_1804_DIR}/../common/grub-tweaks.sh
else
    echo '==> Skipping GRUB tweaks.'
fi

# Install PulseAudio Equalizer
echo '==> Install PulseAudio Equalizer? (Y/n)'
read USER_PROMPT
if [ "$USER_PROMPT" = 'y' ] || [ "$USER_PROMPT" = 'Y' ] || [ "$USER_PROMPT" = '' ]; then
    . ${UBUNTU_1804_DIR}/../common/equalizer.sh
else
    echo '==> Skipping PulseAudio Equalizer.'
fi

# GNOME Shell tweaks
echo '==> Install GNOME tweaks, themes, and extensions? (y/N)'
read USER_PROMPT
if [ "$USER_PROMPT" = 'y' ] || [ "$USER_PROMPT" = 'Y' ]; then
    . ${UBUNTU_1804_DIR}/../common/gnome-tweaks.sh
else
    echo '==> Skipping GNOME tweaks.'
fi

# .bashrc
echo '==> Install ~/.bashrc modifications? (Y/n)'
read USER_PROMPT
if [ "$USER_PROMPT" = 'y' ] || [ "$USER_PROMPT" = 'Y' ] || [ "$USER_PROMPT" = '' ]; then
    . ${UBUNTU_1804_DIR}/../common/bashrc-tweaks.sh
else
    echo '==> Skipping ~/.bashrc tweaks.'
fi

# Install NVIDIA driver
echo '==> Install NVIDIA graphics driver? (y/N)'
read USER_PROMPT
if [ "$USER_PROMPT" = 'y' ] || [ "$USER_PROMPT" = 'Y' ]; then
    sudo ubuntu-drivers autoinstall
else
    echo '==> Skipping NVIDIA driver.'
fi

# Install user applications
echo '==> Install basic packages? (Y/n)'
read USER_PROMPT
if [ "$USER_PROMPT" = 'y' ] || [ "$USER_PROMPT" = 'Y' ] || [ "$USER_PROMPT" = '' ]; then
    sudo apt -y install exfat-fuse gimp gparted guake transmission-gtk virtualbox xclip
else
    echo '==> Skipping basic packages.'
fi

# Install user oriented Snaps
echo '==> Install user Snap packages? (Y/n)'
read USER_PROMPT
if [ "$USER_PROMPT" = 'y' ] || [ "$USER_PROMPT" = 'Y' ] || [ "$USER_PROMPT" = '' ]; then
    . ${UBUNTU_1804_DIR}/../../common/user-snaps.sh
else
    echo '==> Skipping user Snap packages.'
fi

# Install Google Chrome
echo '==> Install Google Chrome? (Y/n)'
read USER_PROMPT
if [ "$USER_PROMPT" = 'y' ] || [ "$USER_PROMPT" = 'Y' ] || [ "$USER_PROMPT" = '' ]; then
    . ${UBUNTU_1804_DIR}/../common/google-chrome.sh
else
    echo '==> Skipping Google Chrome.'
fi

# Install Etcher
echo '==> Install Etcher? (Y/n)'
read USER_PROMPT
if [ "$USER_PROMPT" = 'y' ] || [ "$USER_PROMPT" = 'Y' ] || [ "$USER_PROMPT" = '' ]; then
    . ${UBUNTU_1804_DIR}/../common/etcher.sh
else
    echo '==> Skipping Etcher.'
fi

# Install development tools
echo '==> Install development tools? (Y/n)'
read USER_PROMPT
if [ "$USER_PROMPT" = 'y' ] || [ "$USER_PROMPT" = 'Y' ] || [ "$USER_PROMPT" = '' ]; then
    . ${UBUNTU_1804_DIR}/../common/development-tools.sh
else
    echo '==> Skipping development tools.'
fi

# Remove packages no longer required
sudo apt -y autoremove
