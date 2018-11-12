#! /usr/bin/env bash

set -e

cd "$HOME"

echo "Clone repository from GitLab"
git clone https://gitlab.com/adius/dotfiles.git

cd dotfiles

./bin/symlink-dotfiles

# Mac OS X specific Code
if uname | grep -q "Darwin"
then
  ./install-macos.sh
elif lsb_release -a | grep -q 'Ubuntu'
then
  ./install-ubuntu.sh
fi

# Set fish as default shell
fishPath="$(which fish)"

if "$fishPath"
then
  echo "$fishPath" >> /etc/shells
  chsh -s "$fishPath"
else
  echo "Error: fish is not yet installed"
  exit 1
fi


# Set correct GPG path for git
git config --global gpg.program "$(which gpg)"


# Install global npm modules
npmModules=(
  insect  # Calculator
  live-server  # Development server with auto reloading
  msee  # Markdown terminal renderer
  nodemon  # Development server for node.js
  pageres  # Capture website screenshots
  qrcode  # Display qrcode as ansi art
  surge  # Deploy static websites
  # tldr  # Simple & community driven man pages (currently installed with brew)
  trash  # Move files and folders to the trash
)

npm install --global "${npmModules[@]}"
