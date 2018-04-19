#!/bin/bash

# Elementary OS - Bootstrap

# Exit immediately if a command exits with a non-zero status
set -e

# Update Packages
echo '==> Update packages? (Y/n)'
read UPDATE_PACKAGES
if [ "$UPDATE_PACKAGES" = 'y' ] || [ "$UPDATE_PACKAGES" = 'Y' ] || [ "$UPDATE_PACKAGES" = '' ]; then
    sudo apt update
    sudo apt upgrade -y
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

# .bashrc
echo '==> Install ~/.bashrc modifications? (Y/n)'
read BASHRC_TWEAKS
if [ "$BASHRC_TWEAKS" = 'y' ] || [ "$BASHRC_TWEAKS" = 'Y' ] || [ "$BASHRC_TWEAKS" = '' ]; then
    ./../common/bashrc-tweaks.sh
else
    echo '==> Skipping ~/.bashrc tweaks.'
fi

# Install User Applications
echo '==> Install basic packages? (Y/n)'
read BASIC_PACKAGES
if [ "$BASIC_PACKAGES" = 'y' ] || [ "$BASIC_PACKAGES" = 'Y' ] || [ "$BASIC_PACKAGES" = '' ]; then
    sudo apt install -y exfat-fuse gimp gparted guake transmission-gtk virtualbox xclip
else
    echo '==> Skipping basic packages.'
fi

echo '==> Install Snap support? (Y/n)'
read SNAP_SUPPORT
if [ "$SNAP_SUPPORT" = 'y' ] || [ "$SNAP_SUPPORT" = 'Y' ] || [ "$SNAP_SUPPORT" = '' ]; then
    sudo apt install -y snapd
else
    echo '==> Skipping Snap support.'
fi

echo '==> Install PPA support? (Y/n)'
read PPA_SUPPORT
if [ "$PPA_SUPPORT" = 'y' ] || [ "$PPA_SUPPORT" = 'Y' ] || [ "$PPA_SUPPORT" = '' ]; then
    sudo apt install -y software-properties-common
else
    echo '==> Skipping PPA support.'
fi

# Install User Oriented Snaps
echo '==> Install user Snap packages? (Y/n)'
read USER_SNAPS
if [ "$USER_SNAPS" = 'y' ] || [ "$USER_SNAPS" = 'Y' ] || [ "$USER_SNAPS" = '' ]; then
    ./../../common/user-snaps.sh
else
    echo '==> Skipping user Snap packages.'
fi

# Install Google Chrome
echo '==> Install Google Chrome? (Y/n)'
read GOOGLE_CHROME
if [ "$GOOGLE_CHROME" = 'y' ] || [ "$GOOGLE_CHROME" = 'Y' ] || [ "$GOOGLE_CHROME" = '' ]; then
    ./../common/google-chrome.sh
else
    echo '==> Skipping Google Chrome.'
fi

# Install Etcher
echo '==> Install Etcher? (Y/n)'
read ETCHER
if [ "$ETCHER" = 'y' ] || [ "$ETCHER" = 'Y' ] || [ "$ETCHER" = '' ]; then
    ./../common/etcher.sh
else
    echo '==> Skipping Etcher.'
fi

# Autostart Applications
cp -r ../../autostart/ ~/.config/

# Install Equalizer
echo '==> Install PulseAudio Equalizer? (Y/n)'
read PULSEAUDIO_EQUALIZER
if [ "$PULSEAUDIO_EQUALIZER" = 'y' ] || [ "$PULSEAUDIO_EQUALIZER" = 'Y' ] || [ "$PULSEAUDIO_EQUALIZER" = '' ]; then
    ./../common/equalizer.sh
else
    echo '==> Skipping PulseAudio Equalizer.'
fi

# Install Development Tools
echo '==> Install development tools? (Y/n)'
read DEVELOPMENT_TOOLS
if [ "$DEVELOPMENT_TOOLS" = 'y' ] || [ "$DEVELOPMENT_TOOLS" = 'Y' ] || [ "$DEVELOPMENT_TOOLS" = '' ]; then
    ./../common/development-tools.sh
else
    echo '==> Skipping development tools.'
fi

# GRUB Tweaks
echo '==> Install GRUB tweaks? (Y/n)'
read GRUB_TWEAKS
if [ "$GRUB_TWEAKS" = 'y' ] || [ "$GRUB_TWEAKS" = 'Y' ] || [ "$GRUB_TWEAKS" = '' ]; then
    ./../common/grub-tweaks.sh
else
    echo '==> Skipping GRUB tweaks.'
fi

# Remove Packages No Longer Required
sudo apt autoremove -y
