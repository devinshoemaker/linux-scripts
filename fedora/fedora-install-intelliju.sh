#!/bin/sh

# Install IntelliJ Ultimate on Fedora 26

# Install Required Dependencies
sudo dnf -y install java-1.8.0-openjdk java-1.8.0-openjdk-devel compat-libstdc++-296.i686 compat-libstdc++-33.i686 compat-libstdc++-33.x86_64 glibc.i686 ncurses-libs.i686

# Create and Navigate to Cache Directory
CACHEDIR="/var/cache/fedy/intellij-idea-ultimate";
mkdir -p "$CACHEDIR"
cd "$CACHEDIR"

# Download Latest IntelliJ Ultimate Release
URL=$(wget "https://data.services.jetbrains.com/products/releases?code=IIU&latest=true" -O -| grep -o "https://download.jetbrains.com/idea/ideaIU-[0-9.]*.tar.gz" | head -n 1)
FILE=${URL##*/}

sudo wget -c "$URL" -O "$FILE"

if [[ ! -f "$FILE" ]]; then
	exit 1
fi

# Extract to Installation Directory
sudo tar -xzf "$FILE" -C "/opt/"
sudo mv /opt/idea-IU* "/opt/intellij-idea-ultimate"

# Symlink to /usr/bin
sudo ln -sf "/opt/intellij-idea-ultimate/bin/idea.sh" "/usr/bin/ideaIU"

# Add Icon to GTK
xdg-icon-resource install --novendor --size 128 "/opt/intellij-idea-ultimate/bin/idea.png" "intellij-idea-ue"
sudo gtk-update-icon-cache -f -t /usr/share/icons/hicolor

# Create Desktop Launcher
su -c 'cat <<EOF | tee /usr/share/applications/intellij-idea-ultimate.desktop
[Desktop Entry]
Name=IntelliJ IDEA Ultimate Edition
Type=Application
Icon=intellij-idea-ue
Exec=ideaIU
Comment=The Most Intelligent Java IDE
Categories=Development;IDE;
Keywords=Idea;Java;IDE;
StartupNotify=true
Terminal=false
StartupWMClass=jetbrains-idea
EOF'

# Clean Up
rm idea*.tar.gz
