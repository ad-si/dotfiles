#! /usr/bin/env bash

set -eufo pipefail

uv python install 3.10

ut tool install aider-chat
