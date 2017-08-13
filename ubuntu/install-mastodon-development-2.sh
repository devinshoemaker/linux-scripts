#!/bin/sh

# Ubuntu 16.04/17.04 Mastodon Install Development Script

# Check if rbenv is correctly installed
type rbenv
# Install ruby-build as rbenv plugin
git clone https://github.com/rbenv/ruby-build.git ~/.rbenv/plugins/ruby-build

# Install and Enable Ruby 2.4.1
rbenv install 2.4.1
rbenv global 2.4.1

mkdir -p ~/code
cd ~/code
# Clone the mastodon git repository into ~/code
git clone https://github.com/tootsuite/mastodon.git
# Change directory to ~/code/mastodon
cd ~/code/mastodon
# Checkout to the latest stable branch
git checkout $(git tag -l | sort -V | tail -n 1)
# Install bundler
gem install bundler
# Use bundler to install the rest of the Ruby dependencies
bundle install --deployment --without development test
# Use yarn to install node.js dependencies
yarn install --pure-lockfile
