#! /usr/bin/env bash

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
brews=(
	git
	imagemagick
	mongodb
	node
	optipng
	tree
)

for brew in ${brews[@]}
do
	brew install $brew
done


# Brew casks
echo "Install casks …"

casks=(
	alfred
	#atom
	blender
	cheatsheet
	firefox
	gimp
	handbrake
	google-chrome
	iterm2
	inkscape
	libreoffice
	musescore
	onyx
	opera
	shiftit
	spotify
	textmate
	tunnelblick
	vlc
	xquartz
)

for cask in ${casks[@]}
do
	brew cask install $cask
done

# Remove outdated versions from the cellar
brew cleanup

# Add casks to alfred TODO: Move to another file
brew cask alfred link
