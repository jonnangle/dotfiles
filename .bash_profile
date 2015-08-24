HISTTIMEFORMAT="%Y-%m-%d %T "
export HISTSIZE=10000
export LSCOLORS=ExFxBxDxCxegedabagacad

hash docker-machine 2>/dev/null && eval $(docker-machine env)

alias ls='ls -GFh'

export GITAWAREPROMPT=~/.bash/git-aware-prompt
source $GITAWAREPROMPT/main.sh
export PS1="\[$txtcyn\]\u\[$txtrst\]@\[$txtgrn\]\h:\[$bldylw\]\w \[$txtcyn\]\$git_branch\[$txtred\]\$git_dirty\[$txtrst\]\$ "

alias gd='git diff'
alias gc='git diff --cached'
alias be='bundle exec'

source /opt/boxen/env.sh

export GOPATH=$HOME/dev/go
export PATH=$PATH:$GOPATH/bin

if [ -f `brew --prefix`/etc/autojump.sh ]; then
    . `brew --prefix`/etc/autojump.sh
fi

# Run local profile, if one exists
if [ -f ~/.bash_profile.local ]
then
    . ~/.bash_profile.local
fi

export PATH=$PATH:$HOME/bin
