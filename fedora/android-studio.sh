#!/bin/sh

# Fedora - Install Android Studio

# Install Dependencies
sudo dnf install -y zlib.i686 ncurses-libs.i686 bzip2-libs.i686

# Download Android Studio
URL=$(wget "http://developer.android.com/sdk/index.html" -O - | grep -o "https://dl.google.com/.*/[0-9.]*/android-studio-ide-[0-9.]*-linux.zip" | head -n 1)
FILE=${URL##*/}

wget -c "$URL" -O "$FILE"

# Extract tar.gz
sudo tar -xvzf $FILE -C "/opt/"

# Symlink to /usr/bin
sudo ln -sf "/opt/android-studio/bin/studio.sh" "/usr/bin/android-studio"

# Add GitKraken Icon to GTK
sudo xdg-icon-resource install --novendor --size "scalable" "/opt/android-studio/bin/androidstudio.svg" "android-studio"
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
