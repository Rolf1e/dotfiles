export ARTIFACTORY_USR=tigran.slama
export ARTIFACTORY_PSW=$(pass show api_key_artifactory)
export AWS_PROFILE=default
export AWS_REGION=eu-west-1

alias :q='exit'

aws_login () {
	csq okta set-aws-creds -p $(pass show okta)
}

alias vim="nvim"
alias tc='function _(){ tmux attach-session -t $1; }; _'
alias tl='tmux list-sessions'

export ZSH="$HOME/.oh-my-zsh"
export ZSH_THEME="robbyrussell"


