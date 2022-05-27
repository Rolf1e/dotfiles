
if [ -f ~/.bash_aliases_ffvelo ]; then
    . ~/.bash_aliases_ffvelo
fi

# === SYSTEM ===
#system
alias ll='ls -l'
alias la='ls -A'
alias l='ls -CF'

alias big_files="du -ahx . | sort -rh | head -5"

alias :q="exit"
alias c="clear"
alias cd..="cd.."
alias ..="cd .."

alias mdev="sudo ~/software/.sh/config-ssd.sh"
alias cours='function _(){ cd /media/rolfie/ssd2/projects/cours/$1; }; _'
alias dev='function _(){ cd /media/rolfie/ssd2/projects/$1; }; _'
alias dwn="cd ~/Downloads"
alias doc="cd ~/Documents"

alias tz='function _(){ tar -czvf $1.tar.gz $1; }; _'
alias tx="tar -xzvf"
alias txc='function _(){ tar -xzvf $1 -C $2; }; _'

#screen
alias pc_tower_mod="xrandr --output DP-1 --auto && xrandr --output DP-4 --off"
alias pc_lap_top_mod="xrandr --output DP-4 --auto && xrandr --output DP-1 --off"

#network
alias netstat_tcp='netstat -lntp'

#keyboard
alias us="setxkbmap us"
alias fr="setxkbmap fr"
alias wally='~/software/wally &'

tree_settings() {
	tree -a -L $1 -I ".git|.github|.vscode|.idea|*node_modules|*dist|*target|*__pycache__|$2" --ignore-case
}

alias t3="tree_settings 3"
alias t2="tree_settings 2"
alias t1="tree_settings 1"
alias tn='function _(){ tree_settings $1 $2; }; _'

alias scn="bash ~/software/.sh/screenshot.sh"
alias mscn="bash ~/software/.sh/mouse_screenshot.sh"

#grep
alias grep="rg"
alias erg='function _(){ rg --files --hidden --follow --no-ignore-vcs -g "!{node_modules,.git,target}" $1; }; _'

alias vi="nvim"
alias vim="nvim"

alias fzfi='function _(){ erg $1; };_ | fzf'
alias vifi='vim $(fzfi)'

alias dotfiles="tmcr -a dotfiles; tc dotfiles"

alias background='function _(){ feh --bg-scale $1; }; _'

#docker
alias docker_stopall='docker stop $(docker ps -a -q) && docker rm -fv $(docker ps -aq)'
alias docker_ip_find="docker inspect -f \ '{{range .NetworkSettings.Networks}}{{.IPAddress}}{{end}}'"

#tmux
alias tc='function _(){ tmux attach-session -t $1; }; _'

_curl() {
  verb=$1
  url=$2
  body=$3
  auth=$4

  if [ $# -eq 5 ] #With auth
  then
    echo "Request HTTP $1 with Auth $4 $5"
    curl -X $verb $url -d "$body" -H "Content-Type: application/json" -H "Authorization: $4 $5"
  else
    echo "Request HTTP $1"
    curl -X $verb $url -d "$body" -H "Content-Type: application/json"
  fi
}
alias get='function _(){ curl $1; }; _'
alias post='function _(){ _curl POST $1 $2 $3 $4; }; _'
alias put='function _(){ _curl PUT $1 $2 $3 $4; }; _'

# == DEV  == 

#git
alias gs="git status"
alias gd="git diff"
alias ga="git add"
alias gc="git commit -m"
alias gm="git commit -v"
alias gp="git push"
alias gco="git checkout"
alias grm="git rm --cached -r "

alias ug="ungit &"

#rust
alias cr="clear; cargo run"
alias crb="RUST_BACKTRACE=1 cargo run"
alias cb="clear; cargo build"
alias cc="clear; cargo clippy"
alias ct="clear; cargo test"
alias ctb="RUST_BACKTRACE=1 cargo test -- --nocapture"
alias cf="cargo fmt"

#typeScript
alias tsw="tsc -w"

#java - maven
alias jm="mvn clean install"
alias nmvn='function _(){ mvn -B archetype:generate -DgroupId=com.rolfie.$1 -DartifactId=$1 -DarchetypeArtifactId=maven-archetype-quickstart -DarchetypeVersion=1.4; }; _'
alias mvntest='function _(){ mvn -Dtest=$1 test; }; _'

#sql
#mysql
alias mysqlc="mysql -u root -p"

#psql
alias pg="psql"

# ==  Software ==

#dbeaver
alias dbeaver="~/software/dbeaver/product/community/target/products/org.jkiss.dbeaver.core.product/linux/gtk/x86_64/dbeaver/dbeaver &"

#firefox
alias firefox='function _(){ ~/software/firefox/firefox -new-tab=$1; }; _'
# alias firefox='~/Documents/dotfiles/firefox.sh 2>&1>/dev/null &'

#postman 
alias postman="~/software/Postman/Postman &"

#minizinc
alias mzide="~/software/MiniZincIDE-2.5.1-bundle-linux-x86_64/MiniZincIDE.sh &"

#jetbrains 
alias idea="~/software/idea-IU-202.6397.94/bin/idea.sh &"

alias vlm="pavucontrol &"

# = game =

#ftb
alias ftb="/opt/FTBA/FTBApp &"

alias pdf='function _() { lesspipe $1 | bat; }; _'
