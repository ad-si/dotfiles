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
    
    # TODO:
    # Set preferences with systemsetup
    # e.g. systemsetup -setnetworktimeserver us.pool.ntp.org
    
    
    # Disable window animations
    defaults write NSGlobalDomain NSAutomaticWindowAnimationsEnabled -bool false
    
    # Disable auto-reopen for Quicktime
    defaults write com.apple.QuickTimePlayerX NSQuitAlwaysKeepsWindows -bool false
    
    # Disable auto reopen for Preview
    defaults write com.apple.Preview NSQuitAlwaysKeepsWindows -bool false
    
    # Remove dock slide-in delay
    defaults write com.apple.Dock autohide-delay -float 0 && killall Dock
   
    # Disable startup chime
    sudo nvram SystemAudioVolume=%80
    
	defaults write com.apple.finder QLEnableTextSelection -bool true
	defaults write com.apple.finder FXEnableExtensionChangeWarning -bool false
	defaults write NSGlobalDomain NSNavPanelExpandedStateForSaveMode -bool true
	defaults write NSGlobalDomain PMPrintingExpandedStateForPrint -bool true
	defaults write com.apple.screencapture disable-shadow -bool true
	defaults write com.apple.screencapture location /Users/adrian/Desktop/Screenshots
	defaults write NSNavPanelExpandedStateForSaveMode -bool TRUE
	
    killall Finder
fi
