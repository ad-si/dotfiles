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
  # ag
  # aichat
  # asciinema
  # atuin
  # awscli
  bat
  bun  # JavaScript engine
  # colordiff
  # csvkit  # Utilities for converting to and working with CSV
  # deno  # JavaScript runtime
  diskus
  dockutil
  # doggo  # DNS lookup utility
  # duckdb  # In-memory SQL database system
  exiftool  # Manage meta information of vaious files
  eza
  fastfetch  # Display system information in the terminal
  fclones  # Find duplicate files
  fd
  # fdupes  # Find duplicate files (Use fclones instead)
  fish
  flyctl  # Fly.io CLI
  fnm  # Fast Node.js version manager
  # fzf  # Fuzzy finder
  # gcal  # TODO: Re-add after the formula was re-activated on homebrew
  gh
  git
  git-extras
  # gitbatch  # Tool to manage multiple git repositories
  # gleam  # Gleam programming language
  gnu-sed
  # gnuplot  # A graph plotter with support for various formats
  # go  # Go programming language
  # goaccess  # Web log analyzer
  gopass
  graphviz
  # gum  # Utilities to write shell scripts
  hammerspoon  # Desktop automation
  # hexyl  # Hex viewer
  # heynote  # Note-taking app
  htop
  httpie
  # hunspell
  # hurl  # HTTP client and testing tool
  # hyperfine  # Benchmarking tool
  imagemagick
  jo  # JSON output from a shell
  jq  # JSON processor
  just  # Command runner
  kalker
  kondo  # Clean dependencies and build artifacts
  # kubectl
  # lilypond  # Music notation software
  lychee  # Link checker
  mas  # Mac App Store command line interface
  mdbook # Create books from markdown files
  # micro
  # mitmproxy  # Intercept, modify, replay, or save HTTP traffic
  # mongodb
  # mosh  # Mobile shell
  mpv  # Media player
  # node
  numbat  # Calculator with support for units
  # ocrmypdf  # Add an OCR text layer to scanned PDF files
  ollama
  # optipng
  ocrmypdf  # Add an OCR text layer to scanned PDF files
  openjdk  # Java development kit (Necessary for many programs)
  optipng  # PNG optimizer
  # osx-cpu-temp
  pandoc
  # pandoc-citeproc
  # perspec  # Extract and perspectively correct document images
  pinentry-mac  # Needed for gopass
  pkg-config  # Necessary for stack
  # platypus  # CLI tool only (GUI gets installed with brew cask)
  poppler  # PDF rendering library (Necessary for `rga`)
  rclone  # Rsync for cloud storage
  rga  # Ripgrep wrapper for PDFs, E-Books, Office documents, zip, tar.gz, etc.
  ripgrep
  # ruby  # Programming language
  # s3cmd  # Command-line tool for the Amazon S3 service
  sd  # Intuitive find & replace CLI
  # shellcheck  # Linter for bash scripts
  stack  # Haskell tool stack
  sqlite  # SQLite database
  tcl-tk # Tcl/Tk needed for pdfCropMargins
  tealdeer  # Fast implementation of tldr in Rust
  # tectonic # LaTeX engine
  # tokei  # Display statistics about code
  topgrade
  trash
  translate-shell
  tree
  # tesseract  # OCR (Optical Character Recognition) tool
  # tesseract-lang  # All supported languages
  typos-cli  # Find typos in text
  typst  # Markup based typesetting system
  # uchardet  # Encoding detection library
  uv  # Python package manager
  viu  # Terminal image viewer
  # vlang  # V programming language
  watchexec  # Executes commands in response to file modifications
  wolfram-engine  # Execute Wolfram Language code
  xsv  # CSV command line toolkit written in Rust
  # zola  # Static site generator
  zoxide  # Jump to directories
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
  # opera
  # platypus
  qlstephen  # Preview plain text files without a file extension
  # quicksilver
  # rawtherapee
  # send-to-kindle
  # sigil
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
