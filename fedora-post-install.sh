#!/bin/sh

# Fedora 25 Post Install Script

# Update Packages
sudo dnf check-update &&
sudo dnf upgrade &&

# Google Chrome
sudo cat << EOF > /etc/yum.repos.d/google-chrome.repo
[google-chrome]
name=google-chrome - \$basearch
baseurl=http://dl.google.com/linux/chrome/rpm/stable/\$basearch
enabled=1
gpgcheck=1
gpgkey=https://dl-ssl.google.com/linux/linux_signing_key.pub
EOF &&
sudo dnf install google-chrome-stable &&

# Install user applications
sudo dnf install gparted guake simple-scan
