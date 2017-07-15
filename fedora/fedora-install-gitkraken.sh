#!/bin/sh

# Install GitKraken on Fedora 26

## Download from website 
wget https://release.gitkraken.com/linux/gitkraken-amd64.tar.gz

## Extract tar.gz
tar -xvzf gitkraken-amd64.tar.gz

## Install to opt
sudo rsync -va --delete-after gitkraken/ /opt/GitKraken/

## Add to PATH
export PATH=$PATH:/opt/GitKraken >> ~/.bashrc

## Create desktop launcher
cat << EOF > ~/.local/share/applications/gitkraken.desktop
#!/usr/bin/env xdg-open
[Desktop Entry]
Terminal=false
Type=Application
Name=GitKraken
Exec=/opt/GitKraken/gitkraken
EOF

# Clean up
rm -rf gitkraken*
