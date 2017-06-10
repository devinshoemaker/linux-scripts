#!/bin/sh

# Fedora 25 Post Install Script

# Update Packages
sudo dnf check-update &&
sudo dnf upgrade &&

## Repos

# Google Chrome
sudo cat << EOF > /etc/yum.repos.d/google-chrome.repo
[google-chrome]
name=google-chrome - \$basearch
baseurl=http://dl.google.com/linux/chrome/rpm/stable/\$basearch
enabled=1
gpgcheck=1
gpgkey=https://dl-ssl.google.com/linux/linux_signing_key.pub
EOF &&

# Atom
sudo dnf copr enable mosquito/atom &&

# Install user applications
sudo dnf install google-chrome-stable gparted guake simple-scan

# Install development tools
sudo dnf install atom couchdb
