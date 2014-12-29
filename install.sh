#! /bin/bash

set -e

cd "$HOME"

echo "Clone repository from github"
git clone git://github.com/adius/dotfiles.git

cd dotfiles

bash bin/symlinkDotfiles.sh

# Mac OS X specific Code
if [[ $(uname) == "Darwin" ]]
then
	#Homebrew
	bash bin/setupHomebrew.sh

	#TODO: Tweak OS X
	#defaults write com.apple.finder QLEnableTextSelection -bool true
	#defaults write com.apple.finder FXEnableExtensionChangeWarning -bool false
	#defaults write NSGlobalDomain NSNavPanelExpandedStateForSaveMode -bool true
	#defaults write NSGlobalDomain PMPrintingExpandedStateForPrint -bool true
	#defaults write com.apple.screencapture disable-shadow -bool true
	#defaults write com.apple.screencapture location /Users/adrian/Desktop/Screenshots
	#defaults write NSNavPanelExpandedStateForSaveMode -bool TRUE
	
	#killall Finder

fi
