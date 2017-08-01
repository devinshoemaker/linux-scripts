#!/bin/sh

# Install Arc Theme on Fedora 26

# Enable Arc Copr Repo
sudo dnf -y copr enable user501254/Arc

# Install Arc Icon and Solid Theme
sudo dnf -y install arc-theme-solid arc-icon-theme
