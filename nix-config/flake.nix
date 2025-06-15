# This file contains all my globally installed packages.
# Commented out packages should be installed on a per-project basis.
# Upgrade dependencies with `nix profile upgrade nix-config`
# TODO: Improve this by applying https://nixcademy.com/posts/nix-on-macos/
{
  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixpkgs-unstable";
  };

  outputs = { self, nixpkgs }: {
    packages."aarch64-darwin".default =
      let
        pkgs = nixpkgs.legacyPackages."aarch64-darwin";
      in
        pkgs.buildEnv {
          name = "home-packages";
          paths = with pkgs; [
            # aichat
            # asciinema
            # atuin
            # awscli
            bash
            bat  # `cat` clone with additional features
            bun  # JavaScript engine
            # cargo  # Rust package manager | TODO: Causes problems in cosuz
            # colordiff
            coreutils
            # csvkit  # Utilities for converting to and working with CSV
            delta  # Diff viewer
            # deno  # JavaScript runtime
            dillo  # Fast graphical web browser with a small footprint
            diskus
            dockutil
            # doggo  # DNS lookup utility
            # duckdb  # In-memory SQL database system
            dos2unix  # Convert text files from DOS to Unix format
            exiftool  # Manage meta information of vaious files
            eza
            f3d  # 3D viewer
            fastfetch  # Display system information in the terminal
            fclones  # Find duplicate files
            fd
            fdupes  # Find duplicate files (Use fclones instead)
            findutils  # GNU find utilities
            fish
            flac  # Tools for encoding & decoding FLAC lossless audio files
            flyctl  # Fly.io CLI
            # fnm  # Fast Node.js version manager
            # fzf  # Fuzzy finder
            gcal  # Program for calculating and printing calendars
            gh
            # ghcup  # Haskell toolchain installer | TODO: No current version available
            git
            git-extras
            # gitbatch  # Tool to manage multiple git repositories
            # gleam  # Gleam programming language
            gnumake  # GNU make
            gnupg  # GNU Privacy Guard
            gnused  # GNU sed
            # gnuplot  # A graph plotter with support for various formats
            # go  # Go programming language
            # goaccess  # Web log analyzer
            gopass
            graphviz
            # gum  # Utilities to write shell scripts
            hexyl  # Hex viewer
            # heynote  # Note-taking app
            htop
            httpie
            # hunspell
            # hurl  # HTTP client and testing tool
            # hyperfine  # Benchmarking tool
            imagemagick
            jo  # JSON output from a shell
            jq  # JSON processor
            just  # Command runner
            kalker  # CLI calculator
            kondo  # Clean dependencies and build artifacts
            # kubectl
            leptonica  # Image processing and image analysis library
            # lilypond  # Music notation software
            # lua  # Interpret for Lua language | TODO: Collides with luajit
            luajit
            # lychee  # Link checker
            mas  # Mac App Store command line interface
            # mdbook  # Create books from markdown files
            # micro
            miniserve  # CLI tool to serve files and directories over HTTP
            # mitmproxy  # Intercept, modify, replay, or save HTTP traffic
            # mongodb
            # mosh  # Mobile shell
            mpv  # Media player
            neovide  # Neovim GUI
            neovim  # Text editor
            # node
            nodePackages.svgo  # SVG optimizer
            numbat  # Calculator with support for units
            # ocrmypdf  # Add an OCR text layer to scanned PDF files
            ollama
            # optipng
            openjdk  # Java development kit (Necessary for many programs)
            optipng  # PNG optimizer
            # osx-cpu-temp
            pandoc
            # pandoc-citeproc
            # perspec  # Extract and perspectively correct document images
            pkg-config  # Necessary for stack
            # platypus  # CLI tool only (GUI gets installed with brew cask)
            poppler  # PDF rendering library (Necessary for `rga`)
            rclone  # Rsync for cloud storage
            ripgrep
            ripgrep-all  # Ripgrep wrapper for PDFs, E-Books, Office documents, zip, tar.gz, etc.
            # ruby  # Programming language
            # rustc | TODO: Causes problems in cosuz
            # s3cmd  # Command-line tool for the Amazon S3 service
            sd  # Intuitive find & replace CLI
            # shellcheck  # Linter for bash scripts
            silicon  # Create beautiful images of your source code
            sqlite  # SQLite database
            stylua  # Lua code formatter
            tealdeer  # Fast implementation of tldr in Rust
            tectonic # LaTeX engine
            tokei  # Display statistics about code
            topgrade
            translate-shell
            tree
            # tesseract  # OCR (Optical Character Recognition) tool
            # tesseract-lang  # All supported languages
            typos  # Find typos in text
            typst  # Markup based typesetting system
            # uchardet  # Encoding detection library
            uni  # Unicode database query tool
            uv  # Python package manager
            viu  # Terminal image viewer
            # vlang  # V programming language
            watchexec  # Executes commands in response to file modifications
            # wolfram-engine  # Execute Wolfram Language code | TODO: Not available via Nix yet
            xan  # CLI tool to process CSV files
            # zola  # Static site generator
            zoxide  # Jump to directories
          ];
        };
  };
}
