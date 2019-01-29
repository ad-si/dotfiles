#! /usr/bin/env bash

packages=(
  gitbatch  # Manage git repositories in one place
)

for package in "${packages[@]}"
do
  go get -u "$package"
done
