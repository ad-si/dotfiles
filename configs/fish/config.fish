set -x PATH ~/dotfiles/bin $PATH
set -x PATH /usr/local/sbin $PATH
set -x GOPATH $HOME/.go
set -x PATH $GOPATH/bin $PATH
set -x PATH ~/.gem/ruby/2.0.0/bin $PATH


[ -f /usr/local/share/autojump/autojump.fish ];
and . /usr/local/share/autojump/autojump.fish

set fisher_home ~/.local/share/fisherman
set fisher_config ~/.config/fisherman
source $fisher_home/config.fish

eval (thefuck --alias | tr '\n' ';')
