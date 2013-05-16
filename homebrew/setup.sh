#!/bin/bash

# Install Homebrew
which -s brew

if [[ $? != 0 ]]
then
	echo 'Installing Homebrew…'
	ruby -e "$(curl -fsSL https://raw.github.com/mxcl/homebrew/go)"
fi

#stop on error
set -e

# Make sure we’re using the latest Homebrew
echo 'Update hombrew…'
brew update

# Upgrade any already-installed formulae
echo 'Upgrade hombrew…'
brew upgrade

# Install GNU core utilities (those that come with OS X are outdated)
brew install coreutils
echo "Don’t forget to add $(brew --prefix coreutils)/libexec/gnubin to \$PATH."
# Install GNU `find`, `locate`, `updatedb`, and `xargs`, g-prefixed
brew install findutils
# Install Bash 4
brew install bash

# Install more recent versions of some OS X tools
# brew tap homebrew/dupes
# TODO

# Miscellaneous
brew install git
brew install imagemagick
brew install node
brew install mongodb
brew install tree
brew install optipng

# Remove outdated versions from the cellar
brew cleanup