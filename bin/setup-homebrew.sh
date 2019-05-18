#! /usr/bin/env bash

# Install Homebrew
if ! command -v brew
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
  # ag
  autojump
  bat
  # colordiff
  # csvkit  # Utilities for converting to and working with CSV
  diskus
  exa
  # exiftool
  fd
  # fdupes
  fish
  gcal
  git
  git-extras
  gnu-sed
  # gnuplot  # A graph plotter with support for various formats
  # go  # Go programming language
  gopass
  # graphviz
  htop
  # httpie
  # hunspell
  # imagemagick
  # kubectl
  # micro
  # mongodb
  # node
  # ocrmypdf  # Add an OCR text layer to scanned PDF files
  # optipng
  # osx-cpu-temp
  # pandoc
  # pandoc-citeproc
  # pinentry-mac  # Needed for gopass
  pkg-config  # Necessary for stack
  # platypus  # CLI tool only (GUI gets installed with brew cask)
  # poppler
  ripgrep
  # ruby  # Programming language
  rustup-init  # Installer for Rust programming language
  # s3cmd  # Command-line tool for the Amazon S3 service
  # shellcheck  # Linter for bash scripts
  # stack  # Haskell tool stack
  tealdeer  # Fast implementation of tldr in Rust
  # tokei  # Display statistics about code
  trash
  # translate-shell
  tree
  # tesseract  # OCR (Optical Character Recognition) tool
  # uchardet  # Encoding detection library
  # watchexec  # Executes commands in response to file modifications
  # xsv  # CSV command line toolkit written in Rust
  # yarn
)

for brew in "${brews[@]}"
do
  brew install "$brew"
done


# Brew casks
echo "Install apps and fonts with with 'brew cask' …"

# Must be pre-installed for Inkscape
brew cask install xquartz

casks=(
  affinity-photo
  affinity-designer
  # alfred
  # arduino
  # android-file-transfer
  # atom
  # automap-server FIXME: missing
  # betterzipql  # Preview archives  FIXME: missing
  brave-browser
  # blender
  # calibre
  # cheatsheet
  # chromium
  # cloudcompare FIXME: missing
  # db-browser-for-sqlite
  # dedrm FIXME: missing
  # disk-inventory-x
  docker
  dropbox
  # duet
  # electron-cash
  # electrum
  # emacs
  # filezilla
  # firefox
  # flux
  # fman
  # franz
  # fritzing
  gimp
  # gitup
  # google-chrome
  # google-cloud-sdk
  # handbrake
  # hex-fiend
  homebrew/cask-drivers/logitech-control-center
  homebrew/cask-fonts/font-hasklig-nerd-font-mono  # For editors
  homebrew/cask-fonts/font-sourcecodepro
  homebrew/cask-fonts/font-sourcecodepro-nerd-font-mono  # For terminals
  # homebrew/cask-versions/microsoft-remote-desktop-beta
  # ichm
  # imageplay
  # inkscape
  iterm2
  # kindle
  # kindlegen
  # librecad
  # libreoffice
  logitech-options
  # mactex  # Full installation:
  mactex-no-gui  # Full installation without bundled applications
  mas  # Mac App Store command line interface
  # microsoft-remote-desktop-beta
  # mongohub
  # musescore
  # nvidia-geforce-now
  # onyx
  # opera
  # platypus
  qlstephen  # Preview plain text files without a file extension
  # quicksilver
  # rawtherapee
  # send-to-kindle
  shiftit
  # sigil
  # silverlight
  # sketch
  # sketchup
  # skype
  # slack
  # slic3r
  # squeak FIXME: missing
  # sourcetree
  # speedcrunch    #  Calculator
  spotify
  sublime-text
  # table-tool
  # tad
  # teensy
  telegram
  # texstudio
  # textmate
  thunderbird
  # tor-browser
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
