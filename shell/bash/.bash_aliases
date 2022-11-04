
if [ -f ~/.bash_aliases_ffvelo ]; then
    . ~/.bash_aliases_ffvelo
fi

# === SYSTEM ===
if [ -f ~/.config/shell/common/aliases ]; then
  source ~/.config/shell/common/aliases
fi

alias mdev="sudo ~/Documents/dotfiles/.sh/config-ssd.sh"
alias cours='function _(){ cd /media/rolfie/ssd2/projects/cours/$1; }; _'
alias dev='function _(){ cd /media/rolfie/ssd2/projects/$1; }; _'

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

alias scn="bash ~/software/.sh/screenshot.sh"
alias mscn="bash ~/software/.sh/mouse_screenshot.sh"

alias background='function _(){ feh --bg-scale $1; }; _'


alias ug="ungit &"

#rust
alias cr="clear; cargo run"
alias crb="RUST_BACKTRACE=1 cargo run"
alias cb="clear; cargo build"
alias cc="clear; cargo clippy"
alias ct="clear; cargo test"
alias ctb="RUST_BACKTRACE=1 cargo test -- --nocapture"
alias cf="cargo fmt"

#java - maven
alias jm="mvn clean install"
alias nmvn='function _(){ mvn -B archetype:generate -DgroupId=com.rolfie.$1 -DartifactId=$1 -DarchetypeArtifactId=maven-archetype-quickstart -DarchetypeVersion=1.4; }; _'
alias mvntest='function _(){ mvn -Dtest=$1 test; }; _'

#sql
#mysql
alias mysqlc="mysql -u root -p"

#psql
alias pg="psql"
alias pdf='function _() { lesspipe $1 | bat; }; _'
