#!/bin/sh

# Ubuntu 16.04/17.04 Mastodon Install Development Script

# Check if rbenv is correctly installed
type rbenv
# Install ruby-build as rbenv plugin
git clone https://github.com/rbenv/ruby-build.git ~/.rbenv/plugins/ruby-build

# Install and Enable Ruby 2.4.1
rbenv install 2.4.1
rbenv global 2.4.1

CURRENT_DIRECTORY=$(pwd)
mkdir -p ~/code
cd ~/code
# Clone the mastodon git repository into ~/code
git clone https://github.com/tootsuite/mastodon.git
# Change directory to ~/code/mastodon
cd ~/code/mastodon
# Checkout to the latest stable branch
git checkout $(git tag -l | sort -V | tail -n 1)
# Add Ruby 2.4.1 to PATH
export PATH="$HOME/.rbenv/versions/2.4.1/bin:$PATH"
echo 'export PATH="$HOME/.rbenv/versions/2.4.1/bin:$PATH"' >> ~/.bashrc
# Install bundler
gem install bundler
# Use bundler to install the rest of the Ruby dependencies
bundle install
# Use yarn to install node.js dependencies
yarn install --pure-lockfile

# Continue Part 3
nano $CURRENT_DIRECTORY/install-mastodon-development-3.sh
