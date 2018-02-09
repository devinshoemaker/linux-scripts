#!/bin/sh

# Fedora - Development Tools
# Requires - Snapd

# Install GitKraken
./gitkraken.sh

# Install IntellJ IDEA Ultimate
sudo snap install --classic intellj-idea-ultimate

# Install Visual Studio Code
sudo snap install --classic vscode

# Install CouchDB
sudo snap install couchdb

# Install Node.js
./../common/nodejs.sh

# Install Angular
./../common/angular.sh

# Clone Angular Projects
./../common/angular-projects.sh
