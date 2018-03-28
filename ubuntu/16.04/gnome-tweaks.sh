#!/bin/bash

# Ubuntu 16.04 GNOME Shell Tweaks

# Update Repositories
sudo apt update

# Fix VPN
sudo apt install -y network-manager-openvpn-gnome

# Restart Network Service (Enables VPN)
sudo /etc/init.d/networking restart

# Install GNOME Shell Extensions
#sudo apt install -y gnome-shell-extension-dashtodock gnome-shell-extension-top-icons-plus
