#! /usr/bin/env bash

#Loop over all mac voices

say -v ? | while read line
do
		name=$(echo $line | cut -f 1 -d " ")
		say -v $name $1
done
