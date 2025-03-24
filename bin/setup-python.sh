#! /usr/bin/env bash

set -eufo pipefail

uv python install 3.10

uv tool install \
  aider-chat \
  pdfCropMargins
