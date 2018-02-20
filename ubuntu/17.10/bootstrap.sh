#!/bin/sh

# Ubuntu 17.10 - Bootstrap

# Update Packages
echo '==> Update packages? (Y/n)'
read UPDATE_PACKAGES
if [ "$UPDATE_PACKAGES" = 'y' ] || [ "$UPDATE_PACKAGES" = 'yes' ] || [ "$UPDATE_PACKAGES" = '' ]; then
    sudo apt update
    sudo apt upgrade -y
else
    echo '==> Skipping package updates.'
fi

# Set root password
echo '==> Set root password? (Y/n)'
read ROOT_PASSWORD
if [ "$ROOT_PASSWORD" = 'y' ] || [ "$ROOT_PASSWORD" = 'yes' ] || [ "$ROOT_PASSWORD" = '' ]; then
    sudo passwd root
else
    echo '==> Skipping root password.'
fi

# Disable Universal Time Clock
# fixes time difference in Windows
echo '==> Disable Universal Time Clock? (fixes date & time issues with Windows) (Y/n)'
read DISABLE_UTC
if [ "$DISABLE_UTC" = 'y' ] || [ "$DISABLE_UTC" = 'yes' ] || [ "$DISABLE_UTC" = '' ]; then
    timedatectl set-local-rtc 1 --adjust-system-clock
else
    echo '==> Skip disabling UTC.'
fi

# GNOME Shell Tweaks
echo '==> Install GNOME tweaks, themes, and extensions? (Y/n)'
read GNOME_TWEAKS
if [ "$GNOME_TWEAKS" = 'y' ] || [ "$GNOME_TWEAKS" = 'yes' ] || [ "$GNOME_TWEAKS" = '' ]; then
    ./gnome-tweaks.sh
else
    echo '==> Skipping GNOME tweaks.'
fi

# .bashrc
echo '==> Install ~/.bashrc modifications? (Y/n)'
read BASHRC_TWEAKS
if [ "$BASHRC_TWEAKS" = 'y' ] || [ "$BASHRC_TWEAKS" = 'yes' ] || [ "$BASHRC_TWEAKS" = '' ]; then
    ./../common/bashrc-tweaks.sh
else
    echo '==> Skipping ~/.bashrc tweaks.'
fi

# Install NVIDIA Driver
echo '==> Install NVIDIA graphics driver? (Y/n)'
read NVIDIA_DRIVER
if [ "$NVIDIA_DRIVER" = 'y' ] || [ "$NVIDIA_DRIVER" = 'yes' ] || [ "$NVIDIA_DRIVER" = '' ]; then
    sudo ubuntu-drivers autoinstall
else
    echo '==> Skipping NVIDIA driver.'
fi

# Install User Applications
echo '==> Install basic packages? (Y/n)'
read BASIC_PACKAGES
if [ "$BASIC_PACKAGES" = 'y' ] || [ "$BASIC_PACKAGES" = 'yes' ] || [ "$BASIC_PACKAGES" = '' ]; then
    sudo apt install -y exfat-fuse gimp gnome-boxes gparted guake nemo virtualbox xclip
else
    echo '==> Skipping basic packages.'
fi

# Install User Oriented Snaps
echo '==> Install user Snap packages? (Y/n)'
read USER_SNAPS
if [ "$USER_SNAPS" = 'y' ] || [ "$USER_SNAPS" = 'yes' ] || [ "$USER_SNAPS" = '' ]; then
    ./../common/user-snaps.sh
else
    echo '==> Skipping user Snap packages.'
fi

# Install Google Chrome
echo '==> Install Google Chrome? (Y/n)'
read GOOGLE_CHROME
if [ "$GOOGLE_CHROME" = 'y' ] || [ "$GOOGLE_CHROME" = 'yes' ] || [ "$GOOGLE_CHROME" = '' ]; then
    ./../common/google-chrome.sh
else
    echo '==> Skipping Google Chrome.'
fi

# Install Etcher
echo '==> Install Etcher? (Y/n)'
read ETCHER
if [ "$ETCHER" = 'y' ] || [ "$ETCHER" = 'yes' ] || [ "$ETCHER" = '' ]; then
    ./../common/etcher.sh
else
    echo '==> Skipping Etcher.'
fi

# Autostart Applications
cp -r ../../autostart/ ~/.config/

# Install Equalizer
echo '==> Install PulseAudio Equalizer? (Y/n)'
read PULSEAUDIO_EQUALIZER
if [ "$PULSEAUDIO_EQUALIZER" = 'y' ] || [ "$PULSEAUDIO_EQUALIZER" = 'yes' ] || [ "$PULSEAUDIO_EQUALIZER" = '' ]; then
    ./../common/equalizer.sh
else
    echo '==> Skipping PulseAudio Equalizer.'
fi

# Install Development Tools
echo '==> Install development tools? (Y/n)'
read DEVELOPMENT_TOOLS
if [ "$DEVELOPMENT_TOOLS" = 'y' ] || [ "$DEVELOPMENT_TOOLS" = 'yes' ] || [ "$DEVELOPMENT_TOOLS" = '' ]; then
    ./../common/development-tools.sh
else
    echo '==> Skipping development tools.'
fi

# GRUB Tweaks
echo '==> Install GRUB tweaks? (Y/n)'
read GRUB_TWEAKS
if [ "$GRUB_TWEAKS" = 'y' ] || [ "$GRUB_TWEAKS" = 'yes' ] || [ "$GRUB_TWEAKS" = '' ]; then
    ./../common/grub-tweaks.sh
else
    echo '==> Skipping GRUB tweaks.'
fi

# Remove Packages No Longer Required
sudo apt autoremove -y
