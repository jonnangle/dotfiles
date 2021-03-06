HISTTIMEFORMAT="%Y-%m-%d %T "
export HISTSIZE=10000
export LSCOLORS=ExFxBxDxCxegedabagacad
export EDITOR=vim

alias ls='ls -GFh'

export GITAWAREPROMPT=~/.bash/git-aware-prompt
source $GITAWAREPROMPT/main.sh
export PS1="\[$txtcyn\]\u\[$txtrst\]@\[$txtgrn\]\h:\[$bldylw\]\w \[$txtcyn\]\$git_branch\[$txtred\]\$git_dirty\[$txtrst\]\$ "

alias vi='vim'
alias gd='git diff'
alias gc='git diff --cached'
alias be='bundle exec'
alias k='kubectl'
alias kp='kubectl get pods'
alias kpa='kubectl get pods --all-namespaces'
alias kt='kubetail'
alias kl='kubectl logs'
alias ddig='dig @ns1.p23.dynect.net'

if [ -f /opt/boxen/env.sh ]; then
	source /opt/boxen/env.sh
fi

export GOPATH=$HOME/dev/go
export PATH=$PATH:$GOPATH/bin

eval "$(nodenv init -)"
eval "$(pyenv init -)"
eval "$(pyenv virtualenv-init -)"
eval "$(goenv init -)"

if [ -f `brew --prefix`/etc/autojump.sh ]; then
    . `brew --prefix`/etc/autojump.sh
fi
if [ -f $(brew --prefix autoenv)/activate.sh ]; then
    . $(brew --prefix autoenv)/activate.sh
fi

_complete_csshx () {
        COMPREPLY=()
        cur="${COMP_WORDS[COMP_CWORD]}"
        host_list=$(sed -n 's/^clusters[[:space:]]=[[:space:]]//p' ~/.csshrc)
        COMPREPLY=( $(compgen -W "${host_list}" -- $cur))
        return 0
}
complete -F _complete_csshx csshX

dcleanup(){
	local containers
	containers=( $(docker ps -aq 2>/dev/null) )
	docker rm "${containers[@]}" 2>/dev/null
	local volumes
	volumes=( $(docker ps --filter status=exited -q 2>/dev/null) )
	docker rm -v "${volumes[@]}" 2>/dev/null
	local images
	images=( $(docker images --filter dangling=true -q 2>/dev/null) )
	docker rmi "${images[@]}" 2>/dev/null
}

cert(){
    port=443
    OPENSSL=openssl
    if [ "$2" != "" ] ; then port=$2; fi
    $OPENSSL s_client -servername $1 -connect $1:$port 2>&1 </dev/null | $OPENSSL x509 -noout -text 2>&1 | head -20
}

getK8sRoles() {
    local kind="${1}"
    local name="${2}"
    local namespace="${3:-}"

    kubectl get clusterrolebinding -o json | jq -r "
      .items[]
      | 
      select(
        .subjects[]
        | 
        select(
            .kind == \"${kind}\" 
            and
            .name == \"${name}\"
            and
            (if .namespace then .namespace else \"\" end) == \"${namespace}\"
        )
      )
      |
      (.roleRef.kind + \"/\" + .roleRef.name)
    "
}


# Run local profile, if one exists
if [ -f ~/.bash_profile.local ]
then
    . ~/.bash_profile.local
fi

shopt -s checkhash
SHELL_SESSION_HISTORY=0
export PATH=$PATH:$HOME/bin:$HOME/.local/bin
