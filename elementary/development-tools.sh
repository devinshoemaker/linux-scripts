#!/bin/bash

# Ubuntu - Development Tools

# Exit immediately if a command exits with a non-zero status
set -e

# Update the user's cached credentials, authenticating the user if necessary
sudo -v

# Store a local variable of the scripts current directory
UBUNTU_COMMON_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

# Install Snap Packages
echo '==> Install development Snap packages? (Y/n)'
read SNAP_PACKAGES
if [ "$SNAP_PACKAGES" = 'y' ] || [ "$SNAP_PACKAGES" = 'Y' ] || [ "$SNAP_PACKAGES" = '' ]; then
    . ${UBUNTU_COMMON_DIR}/../../common/development-snaps.sh
else
    echo '==> Skipping development Snap packages.'
fi

# Install Docker
# echo '==> Install Docker? (Y/n)'
# read DOCKER
# if [ "$DOCKER" = 'y' ] || [ "$DOCKER" = 'Y' ] || [ "$DOCKER" = '' ]; then
#     . ${UBUNTU_COMMON_DIR}/../common/docker.sh
# else
#     echo '==> Skipping Docker.'
# fi

# Install Node.js
echo '==> Install Node.js? (Y/n)'
read NODEJS
if [ "$NODEJS" = 'y' ] || [ "$NODEJS" = 'Y' ] || [ "$NODEJS" = '' ]; then
    . ${UBUNTU_COMMON_DIR}/../../common/nodejs.sh
else
    echo '==> Skipping Node.js.'
fi

# Install CouchDB
# echo '==> Install CouchDB? (Y/n)'
# read USER_PROMPT
# if [ "$USER_PROMPT" = 'y' ] || [ "$USER_PROMPT" = 'Y' ] || [ "$USER_PROMPT" = '' ]; then
#     . ${UBUNTU_COMMON_DIR}/../18.04/couchdb.sh
# else
#     echo '==> Skipping CouchDB.'
# fi

# Clone Angular Projects
# echo '==> Clone Angular projects? (Y/n)'
# read ANGULAR_PROJECTS
# if [ "$ANGULAR_PROJECTS" = 'y' ] || [ "$ANGULAR_PROJECTS" = 'Y' ] || [ "$ANGULAR_PROJECTS" = '' ]; then
#     . ${UBUNTU_COMMON_DIR}/../../common/angular-projects.sh
# else
#     echo '==> Skipping Angular projects.'
# fi

# # Clone Ionic Projects
# echo '==> Clone Ionic projects? (Y/n)'
# read IONIC_PROJECTS
# if [ "$IONIC_PROJECTS" = 'y' ] || [ "$IONIC_PROJECTS" = 'Y' ] || [ "$IONIC_PROJECTS" = '' ]; then
#     . ${UBUNTU_COMMON_DIR}/../../common/ionic-projects.sh
# else
#     echo '==> Skipping Ionic projects.'
# fi

# # Install Ubuntu Make
# echo '==> Install Ubuntu Make? (Y/n)'
# read UBUNTU_MAKE
# if [ "$UBUNTU_MAKE" = 'y' ] || [ "$UBUNTU_MAKE" = 'Y' ] || [ "$UBUNTU_MAKE" = '' ]; then
#     . ${UBUNTU_COMMON_DIR}/../common/ubuntu-make.sh
# else
#     echo '==> Skipping Ubuntu Make.'
# fi

# # Install Android Studio
# echo '==> Install Android Studio? (Y/n)'
# read ANDROID_STUDIO
# if [ "$ANDROID_STUDIO" = 'y' ] || [ "$ANDROID_STUDIO" = 'Y' ] || [ "$ANDROID_STUDIO" = '' ]; then
#     . ${UBUNTU_COMMON_DIR}/../common/android-studio.sh
# else
#     echo '==> Skipping Android Studio.'
# fi
