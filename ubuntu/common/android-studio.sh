#!/bin/bash

# Ubuntu - Install Android Studio

# Exit immediately if a command exits with a non-zero status
set -e

# Update the user's cached credentials, authenticating the user if necessary
sudo -v

# Store a local variable of the scripts current directory
UBUNTU_COMMON_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

# Check if Ubuntu Make is installed
if ! command -v umake >/dev/null 2>&1 ; then
    echo "==> Ubuntu Make not found. Installing now..."
    . ${UBUNTU_COMMON_DIR}/ubuntu-make.sh
fi

# Install Android Studio from Ubuntu Make
umake android $HOME/.local/share/umake/android/android-studio --accept-license

# Export ANDROID_HOME
echo 'export ANDROID_HOME=~/Android/Sdk' >> ~/.bashrc

# Export Android Platform Tools to PATH
# echo 'export PATH=$PATH:~/Android/Sdk/platform-tools' >> ~/.bashrc

# Install ADB and Gradle
sudo apt -y install adb gradle
