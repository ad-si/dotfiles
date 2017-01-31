set -x GOPATH $HOME/.go $GOPATH
set -x OSA_LIBRARY_PATH $HOME/dotfiles/script-libraries $OSA_LIBRARY_PATH

# Add paths to path variable with increasing priority
set -x PATH /usr/local/sbin $PATH                                       # User
set -x PATH (brew --prefix homebrew/php/php71)/bin $PATH                # PHP
set -x PATH /Applications/Postgres.app/Contents/Versions/9.4/bin $PATH  # Postgr
set -x PATH $GOPATH/bin $PATH                                           # Go
set -x PATH (brew --prefix ruby)/bin $PATH                              # Ruby
set -x PATH /usr/local/lib/node_modules $PATH                           # Npm
set -x PATH ~/dotfiles/bin $PATH                                        # Custom


[ -f /usr/local/share/autojump/autojump.fish ];
and . /usr/local/share/autojump/autojump.fish

set fisher_home ~/.local/share/fisherman
set fisher_config ~/.config/fisherman
source $fisher_home/config.fish

eval (thefuck --alias | tr '\n' ';')
