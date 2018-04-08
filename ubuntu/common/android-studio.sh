#!/bin/bash

# Ubuntu - Install Android Studio
# Ubuntu Make Required

# Exit immediately if a command exits with a non-zero status
set -e

# Install Android Studio from Ubuntu Make
umake android $HOME/.local/share/umake/android/android-studio --accept-license

# Export ANDROID_HOME
echo 'export ANDROID_HOME=~/Android/Sdk' >> ~/.bashrc

# Export Android Platform Tools to PATH
# echo 'export PATH=$PATH:~/Android/Sdk/platform-tools' >> ~/.bashrc

# Install ADB and Gradle
sudo apt install -y adb gradle
