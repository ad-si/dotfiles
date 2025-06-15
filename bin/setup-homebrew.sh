#! /usr/bin/env bash

set -euo pipefail

# Install Homebrew
if ! command -v brew
then
  echo 'Installing Homebrew…'
  /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
fi

echo >> /Users/adrian/.zprofile
# shellcheck disable=SC2016
echo 'eval "$(/opt/homebrew/bin/brew shellenv)"' >> /Users/adrian/.zprofile
eval "$(/opt/homebrew/bin/brew shellenv)"

# Make sure we’re using the latest Homebrew
echo 'Update hombrew…'
brew update

# Upgrade any already-installed formulae
echo 'Upgrade hombrew…'
brew upgrade

# Install GNU core utilities (those that come with OS X are outdated)
brew install coreutils
# echo "Don’t forget to add $(brew --prefix coreutils)/libexec/gnubin to \$PATH."

# Install GNU `find`, `locate`, `updatedb`, and `xargs`, g-prefixed
brew install findutils

# Install Bash 4
brew install bash

# Install more recent versions of some OS X tools
# brew tap homebrew/dupes
# TODO

# Miscellaneous
brews=(
  hammerspoon  # Desktop automation
  pinentry-mac  # Needed for gopass
  tcl-tk  # Tcl/Tk needed for pdfCropMargins
  trash  # Move files to trash
  wolfram-engine  # Execute Wolfram Language code
)

for brew in "${brews[@]}"
do
  brew install "$brew"
done


# Brew casks
echo "Install apps and fonts with with 'brew cask' …"

# Must be pre-installed for Inkscape
brew install xquartz

casks=(
  affinity-photo
  affinity-designer
  # alfred
  # android-file-transfer
  # angry-ip-scanner
  # anki
  # arduino
  # atom
  # automap-server FIXME: missing
  beekeeper-studio  # SQL Editor and Database Manager
  # betterzipql  # Preview archives  FIXME: missing
  brave-browser
  bruno
  # blender
  # calibre
  # cheatsheet
  # chromium
  # cloudcompare  # FIXME: missing
  # cyberduck
  # db-browser-for-sqlite@nightly
  # dbgate  # SQL database client
  # dedrm  # FIXME: missing
  # defold  # Game engine with Lua scripting
  # diffusionbee
  discord
  # disk-inventory-x
  docker
  dropbox
  # duet
  # electron-cash
  # electrum
  element
  # emacs
  # filezilla
  firefox
  # flux
  # fman  # Dual pane file manager
  # forklift  # Better file manager than Finder
  # franz
  # fritzing
  font-hasklug-nerd-font
  # font-liberation
  # forklift  # File manager
  freecad  # 3D CAD software
  # frescobaldi  # LilyPond music notation editor
  gimp
  # gitup
  godot  # Game engine
  # google-chrome
  # google-cloud-sdk
  # gramps  # Genealogy software
  # handbrake
  # hex-fiend
  # homebrew/cask-versions/microsoft-remote-desktop-beta
  # ichm
  # imageplay
  # inkscape
  iterm2
  # jjazzlab  # Jazz music software
  # jupyterlab
  # kindle
  # kindlegen
  krita  # Digital painting
  # librecad
  # libreoffice
  # lm-studio
  logitech-options
  # microsoft-remote-desktop
  modern-csv  # Desktop app for viewing and editing CSVs
  # mongodb-compass
  # musescore
  nightfall  # Menu bar app to switch between light and dark mode
  notion
  # nvidia-geforce-now
  # onyx
  openscad  # 3D CAD software
  # opera
  # platypus
  qlstephen  # Preview plain text files without a file extension
  # quicksilver
  # rawtherapee
  # send-to-kindle
  # sigil
  signal  # Messaging app
  # silicon  # Create images of your source code
  # silverlight
  # sketch
  # sketchup
  # skype
  # slack
  # slic3r
  # squeak FIXME: missing
  # solvespace  # Parametric 2D/3D CAD
  # sourcetree
  # speedcrunch    #  Calculator
  spotify
  sublime-merge
  sublime-text
  # sweet-home3d  # Interior design software
  tableplus  # Database management app
  # table-tool
  # tad
  # teamviewer  # Remote desktop software
  # teensy
  telegram
  # texstudio
  # textmate
  thunderbird@esr  # Email client (Extended Support Release)
  # tor-browser
  # tunnelblick BUGGY
  # universal-control FIXME: missing
  # vienna
  # virtualbox
  visual-studio-code
  vlc
  # vmware-fusion
  whatsapp
  xquartz
  # zed  # Text and code editor
  zoom  # Video conferencing
)

for cask in "${casks[@]}"
do
  brew install --cask "$cask"
done

# Remove outdated versions from the cellar
brew cleanup
