################################################################################
# This Docker image is for trying out things in NixOS
#
# Build: `make build`
# Run: `docker run --rm -it -v ".:/root/app" ad-si-nixos`
################################################################################

FROM nixos/nix:2.30.1

RUN echo "experimental-features = nix-command flakes" >> /etc/nix/nix.conf

RUN nix-channel --update

# RUN nix profile add nixpkgs#bat
# RUN nix profile add nixpkgs#bun
# RUN nix profile add nixpkgs#delta
RUN nix profile add nixpkgs#direnv
# RUN nix profile add nixpkgs#diskus
# RUN nix profile add nixpkgs#dos2unix
# RUN nix profile add nixpkgs#exiftool
# RUN nix profile add nixpkgs#eza
# RUN nix profile add nixpkgs#fastfetch
# RUN nix profile add nixpkgs#fclones
# RUN nix profile add nixpkgs#fd
# RUN nix profile add nixpkgs#fdupes
# RUN nix profile add nixpkgs#fish
# RUN nix profile add nixpkgs#flac
# RUN nix profile add nixpkgs#gawk
# RUN nix profile add nixpkgs#gcal
# RUN nix profile add nixpkgs#gh
# RUN nix profile add nixpkgs#git-extras
# RUN nix profile add nixpkgs#git-who
# RUN nix profile add nixpkgs#gnumake
# RUN nix profile add nixpkgs#gnupg
# RUN nix profile add nixpkgs#gnused
# RUN nix profile add nixpkgs#gopass
# RUN nix profile add nixpkgs#graphviz
# RUN nix profile add nixpkgs#haskell.compiler.ghc98
# RUN nix profile add nixpkgs#haskellPackages.cabal-fmt
# RUN nix profile add nixpkgs#haskellPackages.cabal-install
# RUN nix profile add nixpkgs#haskellPackages.fourmolu
# RUN nix profile add nixpkgs#haskellPackages.haskell-language-server
# RUN nix profile add nixpkgs#haskellPackages.hlint
# RUN nix profile add nixpkgs#haskellPackages.stack
# RUN nix profile add nixpkgs#hexyl
# RUN nix profile add nixpkgs#htop
# RUN nix profile add nixpkgs#httpie
# RUN nix profile add nixpkgs#imagemagick
# RUN nix profile add nixpkgs#jo
# RUN nix profile add nixpkgs#jq
# RUN nix profile add nixpkgs#just
# RUN nix profile add nixpkgs#kalker
# RUN nix profile add nixpkgs#kondo
# RUN nix profile add nixpkgs#llvmPackages_20.clang-tools
# RUN nix profile add nixpkgs#luajit
# RUN nix profile add nixpkgs#miniserve
# RUN nix profile add nixpkgs#neovim
# RUN nix profile add nixpkgs#nodejs_22
# RUN nix profile add nixpkgs#nodePackages.svgo
# RUN nix profile add nixpkgs#numbat
# RUN nix profile add nixpkgs#optipng
# RUN nix profile add nixpkgs#pandoc
# RUN nix profile add nixpkgs#pkg-config
# RUN nix profile add nixpkgs#poppler
# RUN nix profile add nixpkgs#rclone
# RUN nix profile add nixpkgs#ripgrep
# RUN nix profile add nixpkgs#ripgrep-all
# RUN nix profile add nixpkgs#sd
# RUN nix profile add nixpkgs#silicon
# RUN nix profile add nixpkgs#socat
# RUN nix profile add nixpkgs#sqlite
# RUN nix profile add nixpkgs#stylua
# RUN nix profile add nixpkgs#tealdeer
# RUN nix profile add nixpkgs#tectonic
# RUN nix profile add nixpkgs#tokei
# RUN nix profile add nixpkgs#topgrade
# RUN nix profile add nixpkgs#translate-shell
# RUN nix profile add nixpkgs#tree
# RUN nix profile add nixpkgs#typos
# RUN nix profile add nixpkgs#typst
# RUN nix profile add nixpkgs#uni
# RUN nix profile add nixpkgs#uv
# RUN nix profile add nixpkgs#viu
# RUN nix profile add nixpkgs#watchexec
# RUN nix profile add nixpkgs#xan
# RUN nix profile add nixpkgs#yq
# RUN nix profile add nixpkgs#zig
# RUN nix profile add nixpkgs#zoxide

WORKDIR /root/app

# TODO: CMD ["fish"]
CMD ["bash"]
