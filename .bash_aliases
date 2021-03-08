
# === SYSTEM ===
#system
alias ll='ls -l'
alias la='ls -A'
alias l='ls -CF'
alias mdev="sudo ~/software/.sh/config-ssd.sh"
alias dev='function _(){ cd /media/rolfie/ssd2/projects/$1; }; _'
alias :q="exit"
alias c="clear"
alias dwn="cd ~/Downloads"
alias doc="cd ~/Documents"
alias tz='function _(){ tar czvf $1.tar.gz $1; }; _'
alias tx="tar xzvf"
alias txc='function _(){ tar xzvf $1 -C $2; }; _'
alias cours='function _(){ cd /media/rolfie/ssd2/projects/cours/$1; }; _'
alias vlm="pavucontrol &"

tree_settings() {
	tree -a -L $1 -I ".git|.github|.vscode|.idea|*node_modules|*dist|$2" --ignore-case
}

alias t3="tree_settings 3"
alias t2="tree_settings 2"
alias t1="tree_settings 1"
alias tn='function _(){ tree_settings $1 $2; }; _'

alias scn="bash ~/software/.sh/screenshot.sh"
alias mscn="bash ~/software/.sh/mouse_screenshot.sh"

#grep
alias grep="rg"
alias erg='rg --files --hidden --follow --no-ignore-vcs -g "!{node_modules,.git,target}"'

alias vi="nvim"
alias vim="nvim"

alias fzfi='rg --files --hidden --follow --no-ignore-vcs -g "!{node_modules,.git,target}" | fzf'
alias vifi='vim $(fzfi)'

#keyboard
alias us="setxkbmap us"
alias fr="setxkbmap fr"
alias dotfiles="cd ~/Documents/dotfiles"

alias bg='function _(){ feh --bg-scale $1; }; _'

#tmux
tmux_load() {
	case $1 in
		"stratego") 
			path='/media/rolfie/ssd2/projects/cours/stratego/game-engine'
			watson_start stratego

			create_session stratego $path vim nvim
			create_window stratego ts $path
			;;
		"stratego-rust")
			;;
		"optim")
			path='/media/rolfie/ssd2/projects/cours/optim-master'
			watson_start optim-master

			create_session optim $path vim nvim
			create_window optim ts $path
			;;
    "aoc")
      path='/media/rolfie/ssd2/projects/aoc/'
      create_session aoc $path vim nvim
      create_window aoc term $path
      ;;
		*) 
			echo "I need a correct session name, dumb ass !!"
			;;
	esac
}

watson_start() {
	watson start $1
}

create_session() {
	session=$1
	working_directory=$2
	window=$3
	cmd=$4
	tmux new-session -s $session -c $working_directory -n $window -d $cmd
}

# $1 link to session
# $2 window name 
# $3 working directory
create_window() {
	session=$1
	window=$2
	working_directory=$3
	tmux new-window -t $session: -n $window -c $working_directory 
}

alias tconn='function _(){ tmux attach-session -t $1; }; _'
alias tc='function _() { tmux_load $1; tmux attach-session -t $1; }; _'

# == DEV  == 

#git
alias gs="git status"
alias gd="git diff"
alias ga="git add"
alias gc="git commit -m"
alias gp="git push"
alias gco="git checkout"

alias ug="ungit &"

#rust
alias cr="cargo run"
alias crb="RUST_BACKTRACE=1 cargo run"
alias cb="cargo build"
alias cc="cargo clippy"
alias ct="cargo test"
alias ctb="RUST_BACKTRACE=1 cargo test -- --nocapture"
alias cf="cargo fmt"

#minizinc
alias mzide="~/software/MiniZincIDE-2.5.1-bundle-linux-x86_64/MiniZincIDE.sh &"

#jetbrains 
#intellij
alias idea="~/software/idea-IU-202.6397.94/bin/idea.sh &"

#typeScript
alias tsw="tsc -w"

#mysql
alias mysqlc="mysql -u root -p"

#psql
alias pg="psql"

#postman 
alias postman="~/software/Postman/Postman &"

#java - maven
alias jm="mvn clean install"
alias nmvn='function _(){ mvn -B archetype:generate -DgroupId=com.rolfie.$1 -DartifactId=$1 -DarchetypeArtifactId=maven-archetype-quickstart -DarchetypeVersion=1.4; }; _'
alias mvntest='function _(){ mvn -Dtest=$1 test; }; _'

# ==  Software ==

#firefox
alias firefox="~/software/firefox/firefox -search $1 &"

# = game =

#ftb
alias ftb="/opt/FTBA/FTBApp &"

#keyboard
alias wally='~/software/wally &'

alias pdf='function _() { lesspipe $1 | bat; }; _'
