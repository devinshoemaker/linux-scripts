#!/bin/sh

# Ubuntu -Install Ionic and Download Source Code
# Node.js Required

# Install Ionic
npm install -g ionic cordova

# Add CORS to CouchDB
npm install -g add-cors-to-couchdb
add-cors-to-couchdb

# Download Ionic Source Code
mkdir -p ~/code/ionic
cd ~/code/ionic

git clone https://github.com/dshoe/taskit-ionic.git
git clone https://github.com/dshoe/CryptoProfitLog.git
git clone https://github.com/dshoe/DaysSince.git
git clone https://github.com/dshoe/WaterWatch.git
