#! /bin/bash

dotfiles="$HOME/dotfiles"

set -e

# Names
# echo 'Enter new hostname of the machine (e.g. macbook-name)'
# read hostname
# 
# echo "Setting new hostname to $hostname"
# scutil --set HostName "$hostname"
# compname=$(sudo scutil --get HostName | tr '-' '.')
# 
# echo "Setting computer name to $compname"
# scutil --set ComputerName "$compname"


# SSH
echo "Generate SSH key if it does not exist."
[[ -f "$HOME/.ssh/id_rsa.pub" ]] || ssh-keygen

echo "Copying public key to clipboard. Paste it into your GitHub account:"
[[ -f "$HOME/.ssh/id_rsa.pub" ]] && cat "$HOME/.ssh/id_rsa.pub" | pbcopy

open "https://github.com/account/ssh"


# Mac OS X specific Code
if [[ $(uname) == "Darwin" ]]
then
	#Homebrew
	bash "$dotfiles/hombrew/setup.sh"

	#TODO: Tweak OS X
fi


# Symlink dotfiles
if [[ -d "$dotfiles" ]]
then
	echo "Symlinking dotfiles from $dotfiles"
else
	echo "$dotfiles does not exist"
	exit 1
fi

link() {
	from="$1"
	to="$2"

	echo "Linking $from to $to"
	rm --force "$to"
	ln -s "$from" "$to"
}

for location in home/*
do
	file="${location##*/}"
	file="${file%.*}"
	link "$dotfiles/$location" "$HOME/.$file"
done

# Mac OS X specific
if [[ `uname` == 'Darwin' ]]
then

fi
