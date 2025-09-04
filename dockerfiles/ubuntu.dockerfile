################################################################################
# This Docker image is for trying out things in Ubuntu
#
# Build: `make build`
# Run: `docker run --rm -it -v ".:/root/app" ad-si-ubuntu`
################################################################################

FROM ubuntu:24.04

############################# INSTALL DEPENDENCIES #############################
# TODO: Install fastfetch instead of neofetch once it is available via apt
RUN apt-get update
RUN apt-get install -y \
  build-essential \
  curl \
  git \
  libffi-dev \
  libffi8 \
  libgmp-dev \
  libgmp10 \
  libncurses-dev \
  make \
  neofetch \
  neovim \
  pkg-config \
  unzip

# TODO: # Install Fish
# RUN /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

# Install Bun
RUN curl -fsSL https://bun.sh/install | bash

WORKDIR /root/app

# TODO: CMD ["fish"]
CMD ["bash"]
