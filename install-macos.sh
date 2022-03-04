#! /usr/bin/env bash

# Homebrew
./bin/setup-homebrew.sh


echo "Installing following App Store Apps:"

echo "Affinity Photo (https://itunes.apple.com/de/app/affinity-photo/id824183456?l=en&mt=12)"
echo "Affinity Designer (https://itunes.apple.com/de/app/affinity-designer/id824171161?l=en&mt=12)"
echo "MainStage 3  (https://itunes.apple.com/de/app/mainstage-3/id634159523?l=en&mt=12)"
echo "Xcode (https://itunes.apple.com/de/app/xcode/id497799835?l=en&mt=12)"
echo "Logic Pro X (https://itunes.apple.com/de/app/logic-pro-x/id634148309?l=en&mt=12)"
echo "Final Cut Pro (https://itunes.apple.com/de/app/final-cut-pro/id424389933?l=en&mt=12)"


appIds=(
  824171161  # Affinity Designer
  824183456  # Affinity Photo
  424389933  # Final Cut Pro
  405399194  # Kindle
  634148309  # Logic Pro X
  634159523  # MainStage 3
  504700302  # PDF Squeezer
  497799835  # XCode
)

for appId in "${appIds[@]}"
do
  mas install "$appId"
done

echo "Disable window animations"
defaults write NSGlobalDomain NSAutomaticWindowAnimationsEnabled -bool false

echo "Disable auto-reopen for Quicktime"
defaults write com.apple.QuickTimePlayerX NSQuitAlwaysKeepsWindows -bool false

echo "Disable auto reopen for Preview"
defaults write com.apple.Preview NSQuitAlwaysKeepsWindows -bool false

echo "Open plain text files per default with SublimeText 4"
defaults write com.apple.LaunchServices/com.apple.launchservices.secure \
  LSHandlers -array-add \
  '{LSHandlerContentType=public.plain-text;LSHandlerRoleAll=com.sublimetext.4;}'


echo "===== Configure the Dock ====="

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

echo "Disable creation of .DS_Store files"
defaults write com.apple.desktopservices DSDontWriteNetworkStores true

defaults write com.apple.finder QLEnableTextSelection -bool true
defaults write com.apple.finder FXEnableExtensionChangeWarning -bool false

defaults write NSGlobalDomain NSNavPanelExpandedStateForSaveMode -bool true
defaults write NSGlobalDomain PMPrintingExpandedStateForPrint -bool true

defaults write com.apple.screencapture disable-shadow -bool true
defaults write com.apple.screencapture location /Users/adrian/Desktop/Screenshots

defaults write NSNavPanelExpandedStateForSaveMode -bool TRUE

# TODO:
# Set preferences with systemsetup
# e.g. systemsetup -setnetworktimeserver us.pool.ntp.org

echo 'TODO: Disable "Add period with double space"'

echo 'TODO: Disable "Use smart quotes and dashes"'

# echo "Setup atom editor"
# ./bin/setup-atom


killall Finder
