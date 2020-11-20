
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

alias t3="tree -L 3"
alias t2="tree -L 2"
alias t1="tree -L 1"
alias tn='function _(){ tree -L $1; }; _'

alias scn="bash ~/software/.sh/screenshot.sh"
alias mscn="bash ~/software/.sh/mouse_screenshot.sh"

alias grep="rg"

alias vi="nvim"
alias vim="nvim"

#keyboard
alias us="setxkbmap us"
alias fr="setxkbmap fr"
alias dotfiles="cd ~/Documents/dotfiles"

alias bg='function _(){ feh --bg-scale $1; }; _'


#tmux
tmux_traffic() {
	watson start traffic
	tmux new-session -s traffic -c /media/rolfie/ssd2/projects/cours/traffic -n vim -d nvim

	tmux new-window -t traffic: -n java -c '/media/rolfie/ssd2/projects/cours/traffic/src/main/java/com/rolfie/traffic'
	tmux new-window -t traffic: -n jtest -c '/media/rolfie/ssd2/projects/cours/traffic/src/test/java/com/rolfie/traffic'
	tmux new-window -t traffic: -n bash -c '/media/rolfie/ssd2/projects/cours/traffic'
}

tmux_stratego() {
	watson start stratego
	tmux new-session -s stratego -c /media/rolfie/ssd2/projects/cours/stratego/game-engine -n vim -d nvim

	tmux new-window -t stratego: -n ts -c '/media/rolfie/ssd2/projects/cours/stratego/game-engine'
}

tmux_optim() {
	watson start optim-master
	tmux new-session -s optim -c /media/rolfie/ssd2/projects/cours/optim-master -n vim -d nvim

	tmux new-window -t optim: -n ts -c '/media/rolfie/ssd2/projects/cours/optim-master'
}

alias tconn='function _(){ tmux attach-session -t $1; }; _'
alias tc='function _() { tmux_$1; tmux attach-session -t $1; }; _'

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
alias cb="cargo build"
alias cc="touch ./src/main.rs && cargo clippy"
alias ct="cargo test"
alias ctb="RUST_BACKTRACE=1 cargo test -- --nocapture"
alias cf="cargo fmt"

#minizinc
alias mzide="~/software/MiniZincIDE-2.5.1-bundle-linux-x86_64/MiniZincIDE.sh &"

#jetbrains 
#intellij
alias idea="~/software/idea-IU-202.6397.94/bin/idea.sh &"

#datagrip
alias datagrip="~/software/DataGrip-2020.2.2/bin/datagrip.sh &"

#r
alias rstudio="rstudio &"

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

