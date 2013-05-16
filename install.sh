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
	bash homebrew/setup.sh

	#TODO: Tweak OS X
fi
