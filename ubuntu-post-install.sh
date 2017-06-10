#!/bin/sh

# Ubuntu 16.04.2 Post Install Script

# Update Packages
sudo apt-get update &&
sudo apt-get upgrade

# Install User Applications
sudo apt-get install gparted guake
