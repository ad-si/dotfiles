#! /usr/bin/env bash

# Install Homebrew
which -s brew

if [[ $? != 0 ]]
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
	git
	imagemagick
	mongodb
	node
	optipng
	tree
    caskroom/cask/brew-cask
)

for brew in ${brews[@]}
do
	brew install $brew
done


# Brew casks
echo "Install casks …"

casks=(
	alfred
	#arduino
	atom
	#automap-server MISSING
	betterzipql		# Preview archives
	blender
	#calibre
	cheatsheet
    chromium
	#cloudcompare MISSING
	#dedrm MISSING
	electrum
    #filezilla
	firefox
	#flux
	#fritzing
	gimp
	google-chrome
	handbrake
	#ichm

    caskroom/homebrew-versions/java6
    intellij-idea

	iterm2
	#kindle
	#librecad
	libreoffice
	#mongohub
	musescore
	#onyx
	#opera
	qlstephen		# Preview plain text files without a file extension
	#quicksilver
	shiftit
	silverlight
	#sketchup
	#skype
	slic3r
	#squeak MISSING
	sourcetree
	#speedcrunch		# Calculator
	spotify
	textmate
	#tunnelblick BUGGY
	#universal-control MISSING
	#virtualbox
	vlc
	#vmware-fusion
	xquartz

    # XQuartz dependent casks:
	inkscape
)

for cask in ${casks[@]}
do
	brew cask install $cask
done

# Remove outdated versions from the cellar
brew cleanup
