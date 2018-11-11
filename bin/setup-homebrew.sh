#! /usr/bin/env bash

# Install Homebrew
if ! which -s brew
then
  echo 'Installing Homebrew…'
  ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
fi

# Stop on error
set -e

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
  caskroom/cask/brew-cask
  fdupes
  git
  git-extras
  httpie
  imagemagick
  mongodb
  node
  optipng
  stack  # Haskell tool stack
  tree
)

for brew in "${brews[@]}"
do
  brew install "$brew"
done


# Brew casks
echo "Install casks …"

casks=(
  alfred
  # arduino
  android-file-transfer
  atom
  # automap-server MISSING
  betterzipql   #  Preview archives
  brave
  # blender
  # calibre
  cheatsheet
  chromium
  # cloudcompare MISSING
  db-browser-for-sqlite
  # dedrm MISSING
  disk-inventory-x
  docker
  dropbox
  # duet
  # electron-cash
  # electrum
  # emacs
  # filezilla
  firefox
  flux
  fman
  # franz
  # fritzing
  gimp
  gitup
  google-chrome
  # handbrake
  # hex-fiend
  # ichm
  imageplay
  inkscape
  iterm2
  kindle
  kindlegen
  # librecad
  libreoffice
  logitech-control-center
  microsoft-remote-desktop-beta
  # mongohub
  # musescore
  nvidia-geforce-now
  # onyx
  # opera
  platypus
  qlstephen  # Preview plain text files without a file extension
  # quicksilver
  # rawtherapee
  send-to-kindle
  shiftit
  # sigil
  # silverlight
  sketch
  # sketchup
  skype
  slack
  # slic3r
  # squeak MISSING
  # sourcetree
  # speedcrunch    #  Calculator
  spotify
  sublime-text
  table-tool
  tad
  # teensy
  telegram
  texstudio
  # textmate
  thunderbird
  tor-browser
  # tunnelblick BUGGY
  # universal-control MISSING
  # vienna
  # virtualbox
  # visual-studio-code
  vlc
  # vmware-fusion
  xquartz

  # XQuartz dependent casks:
  inkscape
)

for cask in "${casks[@]}"
do
  brew cask install "$cask"
done

# Remove outdated versions from the cellar
brew cleanup
