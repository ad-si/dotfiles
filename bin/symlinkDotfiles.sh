#! /bin/bash

dotfiles="$HOME/dotfiles"

if [[ -d "$dotfiles" ]]
then
	echo "Symlinking dotfiles from $dotfiles"
    echo "Linking:"
else
	echo "$dotfiles does not exist"
	exit 1
fi

link() {
	from="$1"
	to="$2"

	echo "$from => $to"
	rm -f "$to"
	ln -s "$from" "$to"
}

for location in $dotfiles/home/*
do
	file="${location##*/}"
	file="${file%.*}"
	
	link "$location" "$HOME/.$file"
done

# TODO: Mac OS X specific
# if [[ `uname` == 'Darwin' ]]
# then
# fi
