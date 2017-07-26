#!/bin/sh

# Fedora 26 Post Install Script

# Update Packages
sudo dnf upgrade --refresh

# Install Fedy
sudo sh -c 'curl https://www.folkswithhats.org/installer | bash'
