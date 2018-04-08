#!/bin/bash

# Ubuntu - GNOME Shell Tweaks

# Exit immediately if a command exits with a non-zero status
set -e

# Update Repositories
sudo apt update

# Install Stock GNOME Shell
sudo apt -y install gnome-session

# Fix VPN
sudo apt -y install network-manager-openvpn-gnome

# Restart Network Service (Enables VPN)
sudo /etc/init.d/networking restart

# Install GNOME Shell Extensions
sudo apt -y install gnome-shell-extensions gnome-shell-extension-top-icons-plus

# Install Arc Theme
sudo apt -y install arc-theme

# Install Numix Icon Theme
sudo apt -y install numix-icon-theme

# Change GDM Theme
sudo update-alternatives --config gdm3.css
