#!/bin/sh

# Fedora 26 Post Install Script

# Update Packages
sudo dnf -y upgrade --refresh

# Install Free User Applications
sudo dnf -y install gnome-tweak-tool gparted guake nano pulseaudio-equalizer simple-scan transmission xclip

# Install GNOME extensions
sudo dnf -y install gnome-shell-extension-no-topleft-hot-corner gnome-shell-extension-simple-dock gnome-shell-extension-topicons-plus

# .bashrc
echo export EDITOR=nano >> ~/.bashrc

# Permissive SELinux
sudo sed -i s/^SELINUX=.*$/SELINUX=permissive/g /etc/selinux/config

# Install Fedy
sudo sh -c 'curl https://www.folkswithhats.org/installer | bash'

# exFAT Support
sudo dnf -y install fuse-exfat

# Install media codecs
sudo dnf install gstreamer-plugins-bad gstreamer-plugins-bad-free-extras gstreamer-plugins-bad-nonfree gstreamer-plugins-ugly gstreamer-ffmpeg gstreamer1-libav gstreamer1-plugins-bad-free-extras gstreamer1-plugins-bad-freeworld gstreamer1-plugins-base-tools gstreamer1-plugins-good-extras gstreamer1-plugins-ugly gstreamer1-plugins-bad-free gstreamer1-plugins-good gstreamer1-plugins-base gstreamer1

# NVIDIA Driver
sudo dnf -y install xorg-x11-drv-nvidia akmod-nvidia "kernel-devel-uname-r == $(uname -r)"

# Install Google Chrome
./fedora-install-chrome.sh

# Install Flash Plugin
./fedora-install-flash.sh

# Install GitKraken
./fedora-install-gitkraken.sh

# Install IntelliJ Idea Ultimate
./fedora-install-intelliju.sh
cp -r ../.IntelliJIdea* ~/

# Install Atom
./fedora-install-atom.sh

# Install Arc Theme
./fedora-install-arc-theme.sh

# Update Packages
sudo dnf -y upgrade --refresh

# Reboot
sudo reboot
