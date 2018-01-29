#!/bin/sh

# Ubuntu Install Angular, Ionic, and Download Source Code

# Install Angular
sudo npm install -g @angular/cli

# Install Ionic
sudo npm install -g ionic cordova

# Download Angular Source Code
mkdir -p ~/code/angular
cd ~/code/angular

git clone https://github.com/Dshoe/angular-tour-of-heroes

# Add CORS to CouchDB
sudo npm install -g add-cors-to-couchdb
add-cors-to-couchdb

# Download Ionic Source Code
mkdir -p ~/code/ionic
cd ~/code/ionic

git clone https://github.com/dshoe/taskit-ionic.git
git clone https://github.com/dshoe/CryptoProfitLog.git
git clone https://github.com/dshoe/DaysSince.git
git clone https://github.com/dshoe/WaterWatch.git
