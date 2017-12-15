#!/bin/sh

# Ubuntu 17.10 GNOME Shell Tweaks

# Update Repositories
sudo apt update

# Install Stock GNOME Shell
sudo apt install -y gnome-session

# Fix VPN
sudo apt install -y network-manager-openvpn-gnome

# Restart Network Service (Enables VPN)
sudo /etc/init.d/networking restart

# Install GNOME Shell Extensions
sudo apt install -y gnome-shell-extensions gnome-shell-extension-dashtodock gnome-shell-extension-top-icons-plus

# Change GDM Theme
sudo update-alternatives --config gdm3.css
