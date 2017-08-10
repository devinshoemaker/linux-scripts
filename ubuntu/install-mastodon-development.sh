#!/bin/sh

# Ubuntu 16.04/17.04 Mastodon Install Development Script

# Install curl
sudo apt -y install curl

# Add Node.js Repository
curl -sL https://deb.nodesource.com/setup_6.x | sudo bash -

# Add Yarn Repository
curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg | sudo apt-key add -
echo "deb https://dl.yarnpkg.com/debian/ stable main" | sudo tee /etc/apt/sources.list.d/yarn.list
sudo apt -y update

# Install dependencies
sudo apt -y install imagemagick ffmpeg libpq-dev libxml2-dev libxslt1-dev file git g++ libprotobuf-dev protobuf-compiler pkg-config nodejs gcc-6 autoconf bison build-essential libssl-dev libyaml-dev libreadline6-dev zlib1g-dev libncurses5-dev libffi-dev libgdbm3 libgdbm-dev nginx redis-server redis-tools postgresql postgresql-contrib nginx letsencrypt yarn libidn11-dev libicu-dev

# Set Up rbenv and ruby-build
git clone https://github.com/rbenv/rbenv.git ~/.rbenv
cd ~/.rbenv && src/configure && make -C src
echo 'export PATH="$HOME/.rbenv/bin:$PATH"' >> ~/.bashrc
# Restart shell
exec bash
# Check if rbenv is correctly installed
type rbenv
# Install ruby-build as rbenv plugin
git clone https://github.com/rbenv/ruby-build.git ~/.rbenv/plugins/ruby-build

# Install and Enable Ruby 2.4.1
rbenv install 2.4.1
rbenv global 2.4.1
