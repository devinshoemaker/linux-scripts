#!/bin/sh

# Install Diaspora on Fedora 26 from source

# Install development packages
sudo dnf install tar make automake gcc gcc-c++ git net-tools libcurl-devel libxml2-devel libffi-devel libxslt-devel wget redis ImageMagick nodejs postgresql-devel postgresql-server

# Initialize PostgreSQL database
sudo postgresql-setup initdb

# Enable and start PostgreSQL service
sudo systemctl enable postgresql
sudo systemctl start postgresql

# Enable and start Redis service
sudo systemctl enable redis
sudo systemctl start redis

# Create Diaspora user
sudo adduser diaspora 
sudo passwd diaspora 
