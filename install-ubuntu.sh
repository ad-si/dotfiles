#! /bin/bash

set -e

# Basics
sudo apt update
sudo apt install -y \
  autojump \
  fish \
  tree

# Node.js
curl -sL https://deb.nodesource.com/setup_9.x | sudo -E bash -
sudo apt update
sudo apt install -y nodejs

## Fix npm permissions for global installations
mkdir ~/.npm-global
npm config set prefix '~/.npm-global'


## Yarn
curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg \
  | sudo apt-key add -
echo "deb https://dl.yarnpkg.com/debian/ stable main" \
  | sudo tee /etc/apt/sources.list.d/yarn.list
sudo apt update
sudo apt install -y yarn
