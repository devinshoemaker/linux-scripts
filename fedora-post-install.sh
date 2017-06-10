#!/bin/sh

# Fedora 25 Post Install Script

# Update Packages
sudo dnf check-update &&
sudo dnf upgrade
