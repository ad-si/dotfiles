# Set locales
set -x LANG en_US.UTF-8
set -x LC_ALL en_US.UTF-8

# Set paths for MacOS scripts
set -x OSA_LIBRARY_PATH $HOME/dotfiles/script-libraries $OSA_LIBRARY_PATH


# Add paths to path variable with increasing priority

## User
set -x PATH /usr/local/sbin $PATH

## Postgrs
set -x PATH /Applications/Postgres.app/Contents/Versions/9.4/bin $PATH


## Programming Languages

### PHP
set -x PATH (brew --prefix homebrew/php/php71)/bin $PATH

### Rust
set -x PATH ~/.cargo/bin $PATH

### Go
set -x GOPATH $HOME/.go $GOPATH
set -x PATH $GOPATH/bin $PATH

### Ruby
set -x PATH (brew --prefix ruby)/bin $PATH

### Haskell
set -x PATH ~/.local/bin $PATH

### JavaScript
set -x PATH /usr/local/lib/node_modules $PATH

#### For cli tools exposed with `yarn link`
set -x PATH (yarn global bin) $PATH

#### For cli tools installed with `yarn global add`
set -x PATH ~/.config/yarn/global/node_modules/.bin $PATH

## Custom
set -x PATH ~/dotfiles/bin $PATH


# MatplotLib in iTerm

## Set iTerm as backend for Python's Matplotlib
set -x MPLBACKEND module://itermplot

## Optimize appearance for dark background
set -x ITERMPLOT rv

set -x EDITOR micro
set -x MAIL ~/Mails

set -x AUDIOBOOKS ~/'Dropbox (Personal)'/Audiobooks
set -x BOOKS      ~/'Dropbox (Personal)'/Books
set -x CARDS      ~/'Dropbox (Personal)'/Cards
set -x CHECKLISTS ~/'Dropbox (Personal)'/Checklists
set -x CONTACTS   ~/'Dropbox (Personal)'/Contacts
set -x DOCUMENTS  ~/'Dropbox (Personal)'/Documents
set -x EVENTS     ~/'Dropbox (Personal)'/Events
set -x IDEAS      ~/'Dropbox (Personal)'/Ideas
set -x LINKS      ~/'Dropbox (Personal)'/Links
set -x NEWS       ~/'Dropbox (Personal)'/News
set -x NOTES      ~/'Dropbox (Personal)'/Notes
set -x PHOTOS     ~/'Dropbox (Personal)'/Photos
set -x POSTS      ~/'Dropbox (Personal)'/Posts
set -x RECEIPTS   ~/'Dropbox (Personal)'/Receipts
set -x SHEETMUSIC ~/'Dropbox (Personal)'/Sheetmusic
set -x TASKS      ~/'Dropbox (Personal)'/Tasks
set -x THINGS     ~/'Dropbox (Personal)'/Things
set -x VOUCHERS   ~/'Dropbox (Personal)'/Vouchers


[ -f /usr/local/share/autojump/autojump.fish ]; \
  and . /usr/local/share/autojump/autojump.fish

set fisher_home ~/.local/share/fisherman
set fisher_config ~/.config/fisherman
source $fisher_home/config.fish

eval (thefuck --alias | tr '\n' ';')

# Necessary for signing git commits and tags
set -x GPG_TTY (tty)

test -e {$HOME}/.iterm2_shell_integration.fish ; \
  and source {$HOME}/.iterm2_shell_integration.fish
