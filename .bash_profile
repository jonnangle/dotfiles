HISTTIMEFORMAT="%Y-%m-%d %T "
export HISTSIZE=10000
export LSCOLORS=ExFxBxDxCxegedabagacad

alias ls='ls -GFh'

export GITAWAREPROMPT=~/.bash/git-aware-prompt
source $GITAWAREPROMPT/main.sh
export PS1="\[$txtcyn\]\u\[$txtrst\]@\[$txtgrn\]\h:\[$bldylw\]\w \[$txtcyn\]\$git_branch\[$txtred\]\$git_dirty\[$txtrst\]\$ "

alias vi='/opt/boxen/homebrew/bin/vim'
alias gd='git diff'
alias gc='git diff --cached'
alias be='bundle exec'

source /opt/boxen/env.sh

export GOPATH=$HOME/dev/go
export PATH=$PATH:$GOPATH/bin

if [ -f `brew --prefix`/etc/autojump.sh ]; then
    . `brew --prefix`/etc/autojump.sh
fi
if [ -f $(brew --prefix autoenv)/activate.sh ]; then
    . $(brew --prefix autoenv)/activate.sh
fi

# Run local profile, if one exists
if [ -f ~/.bash_profile.local ]
then
    . ~/.bash_profile.local
fi

shopt -s checkhash
export PATH=$PATH:$HOME/bin
