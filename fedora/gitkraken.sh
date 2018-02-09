#!/bin/sh

# Fedora - Install GitKraken

# Install Dependencies
sudo dnf install -y libXScrnSaver

# Download GitKraken
wget https://release.gitkraken.com/linux/gitkraken-amd64.tar.gz

# Extract tar.gz
sudo tar -xvzf gitkraken-amd64.tar.gz -C "/opt/"

# Symlink to /usr/bin
sudo ln -sf "/opt/gitkraken/gitkraken" "/usr/bin/gitkraken"

# Add GitKraken Icon to GTK
sudo cp "gitkraken.svg" "/usr/share/icons/hicolor/scalable/apps/"
sudo gtk-update-icon-cache -f -t /usr/share/icons/hicolor

# Create Desktop Launcher
cat << EOF > ~/.local/share/applications/gitkraken.desktop
#!/usr/bin/env xdg-open
[Desktop Entry]
Terminal=false
Type=Application
Name=GitKraken
Exec=gitkraken
Icon=gitkraken
EOF

# Clean Up
rm gitkraken-amd64.tar.gz
