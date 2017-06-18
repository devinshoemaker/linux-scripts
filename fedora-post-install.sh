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

# Arc theme
sudo dnf copr enable user501254/Arc

# Install user applications
sudo dnf install arc-theme-solid arc-icon-theme gnome-tweak-tool google-chrome-stable gparted guake nano simple-scan

# Install GNOME extensions
sudo dnf install gnome-shell-extension-no-topleft-hot-corner gnome-shell-extension-simple-dock gnome-shell-extension-topicons-plus

# Install development tools
sudo dnf install atom couchdb vscode
sudo systemctl start couchdb.service
sudo systemctl enable couchdb.service

# .bashrc
echo export EDITOR=nano >> ~/.bashrc

# Install IntelliJ Ultimate

## Download from website 
wget https://download.jetbrains.com/idea/ideaIU-2017.1.4.tar.gz

## Extract tar.gz
tar -xzf idea*.tar.gz 
cd idea*

## Install to opt
sudo mkdir -p /opt/jetbrains/idea
sudo cp -r * /opt/jetbrains/idea/

## Add to PATH
export PATH=$PATH:/opt/jetbrains/idea/bin >> ~/.bashrc

## Create desktop launcher
cat << EOF > ~/.local/share/applications/intellij-idea-ultimate.desktop
#!/usr/bin/env xdg-open
[Desktop Entry]
Terminal=false
Type=Application
Name=IntelliJ IDEA Ultimate
Exec=/opt/jetbrains/idea/bin/idea.sh
Icon=/opt/jetbrains/idea/bin/idea.png
EOF

## Clean up
cd ../
rm -rf idea*

# Download source code

## Ionic
sudo npm install -g ionic cordova
mkdir -p ~/Code/ionic
cd ~/Code/ionic 
git clone https://github.com/dshoe/taskit-ionic.git 
sudo npm install -g add-cors-to-couchdb
add-cors-to-couchdb
