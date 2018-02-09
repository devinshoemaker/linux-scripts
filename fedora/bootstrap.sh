#!/bin/sh

# Fedora Bootstrap

# Update Repositories
sudo dnf check-update

# Upgrade Packages
sudo dnf upgrade -y

# Permissive SELinux
sudo sed -i s/^SELINUX=.*$/SELINUX=permissive/g /etc/selinux/config

# Snap Package Support
./snap.sh

# Add Fusion Repository
su -c 'dnf install http://download1.rpmfusion.org/free/fedora/rpmfusion-free-release-$(rpm -E %fedora).noarch.rpm http://download1.rpmfusion.org/nonfree/fedora/rpmfusion-nonfree-release-$(rpm -E %fedora).noarch.rpm'

# Install NVIDIA Driver
sudo dnf install -y xorg-x11-drv-nvidia akmod-nvidia "kernel-devel-uname-r == $(uname -r)"

# Media Codecs
sudo dnf install -y gstreamer-plugins-bad gstreamer-plugins-bad-free-extras gstreamer-plugins-bad-nonfree gstreamer-plugins-ugly gstreamer-ffmpeg gstreamer1-libav gstreamer1-plugins-bad-free-extras gstreamer1-plugins-bad-freeworld gstreamer1-plugins-base-tools gstreamer1-plugins-good-extras gstreamer1-plugins-ugly gstreamer1-plugins-bad-free gstreamer1-plugins-good gstreamer1-plugins-base gstreamer1

# exFAT Support
sudo dnf install -y fuse-exfat

# GNOME Tweaks
./gnome-tweaks.sh

# ~/.bashrc Tweaks
./bashrc-tweaks.sh

# Install Free Packages From Fedora Repositories
sudo dnf install -y gparted guake nano pulseaudio-equalizer simple-scan transmission xclip

# Install Google Chrome
./google-chrome.sh
