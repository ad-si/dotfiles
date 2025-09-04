if status --is-login
  set systemType (uname)

  # Set locales
  set -x LANG en_US.UTF-8
  set -x LC_ALL en_US.UTF-8

  # Set paths for MacOS scripts
  set -x OSA_LIBRARY_PATH $HOME/dotfiles/script-libraries $OSA_LIBRARY_PATH

  # Add paths to path variable with increasing priority

  ## User
  fish_add_path /usr/local/sbin

  ## Postgres
  # if test $systemType = "Darwin"
  #   fish_add_path /Applications/Postgres.app/Contents/Versions/9.4/bin
  # end

  ## Programming Languages

  ### PHP
  # if test $systemType = "Darwin"
  #   fish_add_path (brew --prefix php)/bin
  # end

  ### Go
  set -x GOPATH $HOME/.go $GOPATH
  fish_add_path $GOPATH/bin

  ### Ruby
  if test $systemType = Darwin
    set -x GEM_HOME $HOME/.gem
    fish_add_path /usr/local/opt/ruby/bin
    fish_add_path $HOME/.gem/bin
  end

  ### Haskell
  fish_add_path ~/.local/bin

  ### Java
  set -x CLASSPATH \
      ".:/usr/local/Cellar/antlr/4.7/antlr-4.7-complete.jar:$CLASSPATH"

  ### JavaScript (Bun)
  fish_add_path ~/.bun/bin
  set -x BUN_INSTALL "$HOME/.bun"
  fish_add_path $BUN_INSTALL/bin

  ## Custom
  fish_add_path ~/dotfiles/bin

  ## Homebrew
  set -U fish_user_paths /opt/homebrew/bin $fish_user_paths

  ### Token allows reading public repos, creating gists)
  if test $systemType = Darwin
  end

  set -x HOMEBREW_CASK_OPTS --no-quarantine
  set -x HOMEBREW_NO_AUTO_UPDATE 1

  ### Rust
  fish_add_path ~/.cargo/bin
  # Must be loaded before `(brew --prefix)/bin`:
  fish_add_path -m (brew --prefix rustup)/bin

  # MatplotLib in iTerm

  ## Set iTerm as backend for Python's Matplotlib
  set -x MPLBACKEND module://itermplot

  ## Optimize appearance for dark background
  set -x ITERMPLOT rv

  # Default editor
  set -x EDITOR sublime-wait

  # Default visual editor
  set -x VISUAL sublime-wait

  # Default locations
  set filesRootPath ~/'Dropbox'

  set -x AUDIOBOOKS $filesRootPath/Audiobooks
  set -x BOOKS $filesRootPath/Books
  set -x CARDS $filesRootPath/Cards
  set -x CHECKLISTS $filesRootPath/Checklists
  set -x CONTACTS $filesRootPath/Contacts
  set -x COMPANIES $filesRootPath/Companies
  set -x DOCUMENTS $filesRootPath/Documents
  set -x EVENTS $filesRootPath/Events
  set -x IDEAS $filesRootPath/Ideas
  set -x LINKS $filesRootPath/Links
  set -x LEADSHEETS $filesRootPath/Leadsheets
  # set -x MAIL ~/Mails
  set -x MAILS $filesRootPath/Mails
  set -x NEWS $filesRootPath/News
  set -x NOTES $filesRootPath/Notes
  set -x PHOTOS $filesRootPath/Photos
  set -x POSTS $filesRootPath/Posts
  set -x RECEIPTS $filesRootPath/Receipts
  set -x SHEETMUSIC $filesRootPath/Sheetmusic
  set -x SONGS $filesRootPath/Songs
  set -x TASKS $filesRootPath/Tasks
  set -x THINGS $filesRootPath/Things
  set -x VOUCHERS $filesRootPath/Vouchers

  # Fish

  ## Zoxide
  zoxide init fish --cmd j | source

  ## iTerm
  test -e {$HOME}/.iterm2_shell_integration.fish
  and source {$HOME}/.iterm2_shell_integration.fish

  # thefuck
  # if type -q thefuck # Check if `thefuck` is something executable
  #   eval (thefuck --alias | tr '\n' ';')
  # end

  # GPG (Necessary for signing git commits and tags)
  set -x GPG_TTY (tty)

  # Enable color output for github.com/chrisallenlane/cheat
  set -x CHEATCOLORS true

  # # TODO: Reenable after https://github.com/ellie/atuin/issues/978
  # if status --is-interactive
  #   atuin init fish | source
  # end

  fish_add_path /usr/local/opt/sqlite/bin

  # Haskell
  fish_add_path $HOME/.cabal/bin
  fish_add_path /Users/adrian/.ghcup/bin
  set -q GHCUP_INSTALL_BASE_PREFIX[1]; or set GHCUP_INSTALL_BASE_PREFIX $HOME

  # Set ripgrep config path
  set -x RIPGREP_CONFIG_PATH /Users/adrian/dotfiles/configs/ripgrep/ripgrep.txt

end
