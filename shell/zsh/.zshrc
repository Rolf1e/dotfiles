
alias :q='exit'


alias vim="nvim"
alias tc='function _(){ tmux attach-session -t $1; }; _'
alias tl='tmux list-sessions'

source ~/.config/shell/common/env
source ~/.config/shell/zsh/zsh_prompt
source ~/.config/shell/zsh/zsh_aliases
source ~/.config/shell/zsh/.zsh_local


