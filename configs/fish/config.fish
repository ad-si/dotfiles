if status --is-login
  # Set locales
  set -x LANG en_US.UTF-8
  set -x LC_ALL en_US.UTF-8

  # Set paths for MacOS scripts
  set -x OSA_LIBRARY_PATH $HOME/dotfiles/script-libraries $OSA_LIBRARY_PATH


  # Add paths to path variable with increasing priority

  ## User
  set -x PATH /usr/local/sbin $PATH

  ## Postgres
  if test (uname) = "Darwin"
    set -x PATH /Applications/Postgres.app/Contents/Versions/9.4/bin $PATH
  end

  ## Programming Languages

  ### PHP
  if test (uname) = "Darwin"
    set -x PATH (brew --prefix php)/bin $PATH
  end

  ### Rust
  set -x PATH ~/.cargo/bin $PATH

  ### Go
  set -x GOPATH $HOME/.go $GOPATH
  set -x PATH $GOPATH/bin $PATH

  ### Ruby
  if test (uname) = "Darwin"
    set -x PATH (brew --prefix ruby)/bin $PATH
  end

  ### Haskell
  set -x PATH ~/.local/bin $PATH

  ### Java
  set -x CLASSPATH \
    ".:/usr/local/Cellar/antlr/4.7/antlr-4.7-complete.jar:$CLASSPATH"

  ### JavaScript

  #### For cli tools installed with `yarn global add`
  set -x PATH ~/.config/yarn/global/node_modules/.bin $PATH

  #### Tools installed with npm
  set -x PATH (npm bin --global) $PATH

  ## Custom
  set -x PATH ~/dotfiles/bin $PATH

  ## Homebrew (token allows reading public repos, creating gists)
  if test (uname) = "Darwin"
    set -x HOMEBREW_GITHUB_API_TOKEN replace_this_with_secret_token
  end


  # MatplotLib in iTerm

  ## Set iTerm as backend for Python's Matplotlib
  set -x MPLBACKEND module://itermplot

  ## Optimize appearance for dark background
  set -x ITERMPLOT rv


  # Default editor
  set -x EDITOR sublime-wait


  # Default locations
  set filesRootPath ~/'Dropbox (Personal)'

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
  set -x MAIL ~/Mails
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
  ## Autojump
  test -e /usr/local/share/autojump/autojump.fish
  and source /usr/local/share/autojump/autojump.fish

  test -e /usr/share/autojump/autojump.fish
  and source /usr/share/autojump/autojump.fish

  ## iTerm
  test -e {$HOME}/.iterm2_shell_integration.fish
  and source {$HOME}/.iterm2_shell_integration.fish


  # thefuck
  if type -q thefuck # Check if `thefuck` is something executable
    eval (thefuck --alias | tr '\n' ';')
  end

  # GPG (Necessary for signing git commits and tags)
  set -x GPG_TTY (tty)
end

# tabtab source for serverless package
# uninstall by removing these lines or running `tabtab uninstall serverless`
[ -f /Users/adrian/dotfiles/configs/yarn/global/node_modules/tabtab/.completions/serverless.fish ];
  and . /Users/adrian/dotfiles/configs/yarn/global/node_modules/tabtab/.completions/serverless.fish
# tabtab source for sls package
# uninstall by removing these lines or running `tabtab uninstall sls`
[ -f /Users/adrian/dotfiles/configs/yarn/global/node_modules/tabtab/.completions/sls.fish ];
  and . /Users/adrian/dotfiles/configs/yarn/global/node_modules/tabtab/.completions/sls.fish

set -g fish_user_paths "/usr/local/opt/node@8/bin" $fish_user_paths
