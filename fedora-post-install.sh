#!/bin/sh

# Fedora 25 Post Install Script

## Repos
## Run manually first! Then remove before running script.

su

# Google Chrome

cat << EOF > /etc/yum.repos.d/google-chrome.repo
[google-chrome]
name=google-chrome - \$basearch
baseurl=http://dl.google.com/linux/chrome/rpm/stable/\$basearch
enabled=1
gpgcheck=1
gpgkey=https://dl-ssl.google.com/linux/linux_signing_key.pub
EOF

exit

# Update Packages
sudo dnf check-update
sudo dnf upgrade

# Atom
sudo dnf copr enable mosquito/atom

# Visual Studio Code
sudo dnf copr enable mosquito/vscode

# Install user applications
sudo dnf install gnome-tweak-tool google-chrome-stable gparted guake simple-scan

# Install development tools
sudo dnf install atom couchdb vscode
