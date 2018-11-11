#! /usr/bin/env bash

set -e

echo 'Enter new hostname of the machine (e.g. macbook-name)'
read -r hostname

echo "Setting new hostname to $hostname"
scutil --set HostName "$hostname"
compname=$(sudo scutil --get HostName | tr '-' '.')

echo "Setting computer name to $compname"
scutil --set ComputerName "$compname"
