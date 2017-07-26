#!/bin/sh

# Fedora 26 Post Install Script

# Install Fedy
sudo sh -c 'curl https://www.folkswithhats.org/installer | bash'

# Update Packages
sudo dnf upgrade --refresh
