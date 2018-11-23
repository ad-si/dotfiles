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
  ag
  autojump
  bat
  colordiff
  exa
  fd
  fdupes
  fish
  gcal
  git
  git-extras
  gnu-sed
  gopass
  httpie
  hunspell
  imagemagick
  kubectl
  mongodb
  node
  optipng
  pandoc
  # pandoc-citeproc
  pinentry-mac  # Needed for gopass
  platypus  # CLI tool only (GUI gets installed with brew cask)
  ruby
  stack  # Haskell tool stack
  tldr
  translate-shell
  tree
  xsv  # CSV command line toolkit written in Rust
  yarn
)

for brew in "${brews[@]}"
do
  brew install "$brew"
done


# Brew casks
echo "Install casks …"

# Must be pre-installed for Inkscape
brew cask install xquartz

casks=(
  alfred
  # arduino
  android-file-transfer
  atom
  # automap-server FIXME: missing
  # betterzipql  # Preview archives  FIXME: missing
  brave-browser
  # blender
  # calibre
  cheatsheet
  chromium
  # cloudcompare FIXME: missing
  db-browser-for-sqlite
  # dedrm FIXME: missing
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
  google-cloud-sdk
  # handbrake
  # hex-fiend
  homebrew/cask-drivers/logitech-control-center
  homebrew/cask-versions/microsoft-remote-desktop-beta
  # ichm
  imageplay
  inkscape
  iterm2
  kindle
  kindlegen
  # librecad
  libreoffice
  logitech-options
  mactex
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
  # squeak FIXME: missing
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
  # universal-control FIXME: missing
  # vienna
  # virtualbox
  # visual-studio-code
  vlc
  # vmware-fusion
  xquartz
)

for cask in "${casks[@]}"
do
  brew cask install "$cask"
done

# Remove outdated versions from the cellar
brew cleanup
