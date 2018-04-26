#!/bin/bash

# Ubuntu 18.04 - Bootstrap

# Exit immediately if a command exits with a non-zero status
set -e

# Store a local variable of the scripts current directory
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

# Set root password
echo '==> Set root password? (Y/n)'
read ROOT_PASSWORD
if [ "$ROOT_PASSWORD" = 'y' ] || [ "$ROOT_PASSWORD" = 'Y' ] || [ "$ROOT_PASSWORD" = '' ]; then
    sudo passwd root
else
    echo '==> Skipping root password.'
fi

# GRUB tweaks
echo '==> Install GRUB tweaks? (Y/n)'
read GRUB_TWEAKS
if [ "$GRUB_TWEAKS" = 'y' ] || [ "$GRUB_TWEAKS" = 'Y' ] || [ "$GRUB_TWEAKS" = '' ]; then
    . ${BOOTSTRAP_DIR}/../common/grub-tweaks.sh
else
    echo '==> Skipping GRUB tweaks.'
fi

# Install PulseAudio Equalizer
echo '==> Install PulseAudio Equalizer? (Y/n)'
read PULSEAUDIO_EQUALIZER
if [ "$PULSEAUDIO_EQUALIZER" = 'y' ] || [ "$PULSEAUDIO_EQUALIZER" = 'Y' ] || [ "$PULSEAUDIO_EQUALIZER" = '' ]; then
    . ${BOOTSTRAP_DIR}/../common/equalizer.sh
else
    echo '==> Skipping PulseAudio Equalizer.'
fi

# GNOME Shell tweaks
echo '==> Install GNOME tweaks, themes, and extensions? (y/N)'
read GNOME_TWEAKS
if [ "$GNOME_TWEAKS" = 'y' ] || [ "$GNOME_TWEAKS" = 'Y' ]; then
    . ${BOOTSTRAP_DIR}/../common/gnome-tweaks.sh
else
    echo '==> Skipping GNOME tweaks.'
fi

# .bashrc
echo '==> Install ~/.bashrc modifications? (Y/n)'
read BASHRC_TWEAKS
if [ "$BASHRC_TWEAKS" = 'y' ] || [ "$BASHRC_TWEAKS" = 'Y' ] || [ "$BASHRC_TWEAKS" = '' ]; then
    . ${BOOTSTRAP_DIR}/../common/bashrc-tweaks.sh
else
    echo '==> Skipping ~/.bashrc tweaks.'
fi

# Install NVIDIA driver
echo '==> Install NVIDIA graphics driver? (y/N)'
read NVIDIA_DRIVER
if [ "$NVIDIA_DRIVER" = 'y' ] || [ "$NVIDIA_DRIVER" = 'Y' ]; then
    sudo ubuntu-drivers autoinstall
else
    echo '==> Skipping NVIDIA driver.'
fi

# Install user applications
echo '==> Install basic packages? (Y/n)'
read BASIC_PACKAGES
if [ "$BASIC_PACKAGES" = 'y' ] || [ "$BASIC_PACKAGES" = 'Y' ] || [ "$BASIC_PACKAGES" = '' ]; then
    sudo apt -y install exfat-fuse gimp gparted guake transmission-gtk virtualbox xclip

    # Autostart applications
    cp -r ${BOOTSTRAP_DIR}/../../autostart/ ~/.config/
else
    echo '==> Skipping basic packages.'
fi

# Install user oriented Snaps
echo '==> Install user Snap packages? (Y/n)'
read USER_SNAPS
if [ "$USER_SNAPS" = 'y' ] || [ "$USER_SNAPS" = 'Y' ] || [ "$USER_SNAPS" = '' ]; then
    . ${BOOTSTRAP_DIR}/../../common/user-snaps.sh
else
    echo '==> Skipping user Snap packages.'
fi

# Install Google Chrome
echo '==> Install Google Chrome? (Y/n)'
read GOOGLE_CHROME
if [ "$GOOGLE_CHROME" = 'y' ] || [ "$GOOGLE_CHROME" = 'Y' ] || [ "$GOOGLE_CHROME" = '' ]; then
    . ${BOOTSTRAP_DIR}/../common/google-chrome.sh
else
    echo '==> Skipping Google Chrome.'
fi

# Install Etcher
echo '==> Install Etcher? (Y/n)'
read ETCHER
if [ "$ETCHER" = 'y' ] || [ "$ETCHER" = 'Y' ] || [ "$ETCHER" = '' ]; then
    . ${BOOTSTRAP_DIR}/../common/etcher.sh
else
    echo '==> Skipping Etcher.'
fi

# Install development tools
echo '==> Install development tools? (Y/n)'
read DEVELOPMENT_TOOLS
if [ "$DEVELOPMENT_TOOLS" = 'y' ] || [ "$DEVELOPMENT_TOOLS" = 'Y' ] || [ "$DEVELOPMENT_TOOLS" = '' ]; then
    . ${BOOTSTRAP_DIR}/../common/development-tools.sh
else
    echo '==> Skipping development tools.'
fi

# Remove packages no longer required
sudo apt -y autoremove
