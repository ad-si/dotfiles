#! /usr/bin/env bash

set -e

echo "Generate SSH key if it does not exist."
[[ -f "$HOME/.ssh/id_rsa.pub" ]] || ssh-keygen

echo "Copying public key to clipboard. Paste it into your GitHub account:"
[[ -f "$HOME/.ssh/id_rsa.pub" ]] && pbcopy < "$HOME/.ssh/id_rsa.pub"

open "https://github.com/account/ssh"
