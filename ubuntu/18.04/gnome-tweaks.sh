#!/bin/bash

# Ubuntu - GNOME Shell Tweaks

# Exit immediately if a command exits with a non-zero status
set -e

# Update the user's cached credentials, authenticating the user if necessary
sudo -v

# Store a local variable of the scripts current directory
UBUNTU_COMMON_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

echo "==> Install vanilla GNOME Shell session? (Y/n)"
read USER_PROMPT
if [ "$USER_PROMPT" = 'y' ] || [ "$USER_PROMPT" = 'Y' ] || [ "$USER_PROMPT" = '' ]; then
    sudo apt -y install gnome-session
else
    echo "==> Skipping vanilla GNOME Shell session."
fi

echo "==> Set default GNOME Shell settings? (Y/n)"
read USER_PROMPT
if [ "$USER_PROMPT" = 'y' ] || [ "$USER_PROMPT" = 'Y' ] || [ "$USER_PROMPT" = '' ]; then
    # Set 24 Hour Clock
    gsettings set org.gnome.desktop.interface clock-format 12h

    # Disable Desktop Sound Effects
    gsettings set org.gnome.desktop.sound event-sounds false

    # Set Screen Timeout to 15 Minutes
    gsettings set org.gnome.desktop.session idle-delay 900

    # Automatic Suspend
    gsettings set org.gnome.settings-daemon.plugins.power sleep-inactive-ac-type 'suspend'

    # Set Automatic Suspend Timeout to 2 Hours
    gsettings set org.gnome.settings-daemon.plugins.power sleep-inactive-ac-timeout 7200
else
    echo "==> Skipping default GNOME Shell settings."
fi

echo "==> Fix VPN? (Y/n)"
read USER_PROMPT
if [ "$USER_PROMPT" = 'y' ] || [ "$USER_PROMPT" = 'Y' ] || [ "$USER_PROMPT" = '' ]; then
    # Install OpenVPN Plugin
    sudo apt -y install network-manager-openvpn-gnome

    # Restart Network Service (Enables VPN)
    sudo /etc/init.d/networking restart
else
    echo "==> Skipping VPN fix."
fi

echo "==> Install GNOME Shell extensions? (Y/n)"
read USER_PROMPT
if [ "$USER_PROMPT" = 'y' ] || [ "$USER_PROMPT" = 'Y' ] || [ "$USER_PROMPT" = '' ]; then
    sudo apt -y install gnome-shell-extensions gnome-shell-extension-top-icons-plus
else
    echo "==> Skipping GNOME Shell extensions."
fi

echo "==> Install custom themes? (Y/n)"
read USER_PROMPT
if [ "$USER_PROMPT" = 'y' ] || [ "$USER_PROMPT" = 'Y' ] || [ "$USER_PROMPT" = '' ]; then
    # Install Arc Theme
    sudo apt -y install arc-theme

    # Install Pop!_OS Theme
    . ${UBUNTU_COMMON_DIR}/pop_os-theme.sh

    # Install Numix Icon Theme
    sudo apt -y install numix-icon-theme

    # Install Moka Icon Theme
    sudo add-apt-repository -y ppa:moka/daily
    sudo apt update
    sudo apt -y install moka-icon-theme
else
    echo "==> Skipping custom themes."
fi

echo "==> Change GDM theme? (Y/n)"
read USER_PROMPT
if [ "$USER_PROMPT" = 'y' ] || [ "$USER_PROMPT" = 'Y' ] || [ "$USER_PROMPT" = '' ]; then
    sudo update-alternatives --config gdm3.css
else
    echo "==> Skipping GDM theme change."
fi
