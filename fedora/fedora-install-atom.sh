#!/bin/sh

# Install Atom on Fedora 26

# Enable Atom Copr Repo
sudo dnf copr enable mosquito/atom

# Install Atom
sudo dnf -y install atom
