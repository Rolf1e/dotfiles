
alias :q='exit'


alias vim="nvim"
alias tc='function _(){ tmux attach-session -t $1; }; _'
alias tl='tmux list-sessions'

source ~/.config/shell/common/env
source ~/.config/shell/zsh/zsh_prompt
source ~/.config/shell/zsh/zsh_aliases
source ~/.config/shell/zsh/.zsh_local

export NVM_DIR="$HOME/.nvm"
  [ -s "/opt/homebrew/opt/nvm/nvm.sh" ] && \. "/opt/homebrew/opt/nvm/nvm.sh"  # This loads nvm
  [ -s "/opt/homebrew/opt/nvm/etc/bash_completion.d/nvm" ] && \. "/opt/homebrew/opt/nvm/etc/bash_completion.d/nvm"  # This loads nvm bash_completion

#THIS MUST BE AT THE END OF THE FILE FOR SDKMAN TO WORK!!!
export SDKMAN_DIR="$HOME/.sdkman"
[[ -s "$HOME/.sdkman/bin/sdkman-init.sh" ]] && source "$HOME/.sdkman/bin/sdkman-init.sh"

eval "$(csq aws sso init-plugin zsh)"
path+=(/Users/tigranslama/.local/bin); export PATH
