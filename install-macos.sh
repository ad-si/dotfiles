#! /usr/bin/env bash

# Homebrew
./bin/setup-homebrew.sh

# TODO:
# Set preferences with systemsetup
# e.g. systemsetup -setnetworktimeserver us.pool.ntp.org

echo "Disable window animations"
defaults write NSGlobalDomain NSAutomaticWindowAnimationsEnabled -bool false

echo "Disable auto-reopen for Quicktime"
defaults write com.apple.QuickTimePlayerX NSQuitAlwaysKeepsWindows -bool false

echo "Disable auto reopen for Preview"
defaults write com.apple.Preview NSQuitAlwaysKeepsWindows -bool false


echo "Configure the Dock"

echo "Remove default app icons"
defaults write com.apple.dock persistent-apps -array

echo "Set icon size to 48px"
defaults write com.apple.dock tilesize -int 48px

echo "Remove slide-in delay"
defaults write com.apple.dock autohide-delay -float 0

echo "Enable autohide"
defaults write com.apple.dock autohide -bool true

echo "Set animation speed to 0.5s"
defaults write com.apple.dock autohide-time-modifier -float 0.5

echo "Restart Dock"
killall Dock


echo "Disable startup chime"
sudo nvram SystemAudioVolume=%80

echo "Set default theme to dark (Restart your Mac to see changes)"
sudo defaults write /Library/Preferences/.GlobalPreferences AppleInterfaceTheme Dark

echo "Disable creation of .DS_Store files"
defaults write com.apple.desktopservices DSDontWriteNetworkStores true

defaults write com.apple.finder QLEnableTextSelection -bool true
defaults write com.apple.finder FXEnableExtensionChangeWarning -bool false

defaults write NSGlobalDomain NSNavPanelExpandedStateForSaveMode -bool true
defaults write NSGlobalDomain PMPrintingExpandedStateForPrint -bool true

defaults write com.apple.screencapture disable-shadow -bool true
defaults write com.apple.screencapture location /Users/adrian/Desktop/Screenshots

defaults write NSNavPanelExpandedStateForSaveMode -bool TRUE

killall Finder

# echo "Setup atom editor"
# ./bin/setup-atom
