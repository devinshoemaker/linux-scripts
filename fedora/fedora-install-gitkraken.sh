#!/bin/sh

# Install GitKraken on Fedora 26

# Install Dependencies
sudo dnf install libXScrnSaver

## Download from website 
wget https://release.gitkraken.com/linux/gitkraken-amd64.tar.gz

## Extract tar.gz
tar -xvzf gitkraken-amd64.tar.gz -C "/opt/"

## Symlink to /usr/bin
sudo ln -sf "/opt/gitkraken/gitkraken" "/usr/bin/gitkraken"

## Add the GitKraken Icon to GTK
sudo cp "gitkraken.svg" "/usr/share/icons/hicolor/scalable/apps/"
sudo gtk-update-icon-cache -f -t /usr/share/icons/hicolor

## Create desktop launcher
cat << EOF > ~/.local/share/applications/gitkraken.desktop
#!/usr/bin/env xdg-open
[Desktop Entry]
Terminal=false
Type=Application
Name=GitKraken
Exec=gitkraken
Icon=gitkraken
EOF

# Clean up
rm -rf gitkraken*
