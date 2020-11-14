# ~/.bashrc: executed by bash(1) for non-login shells.
# see /usr/share/doc/bash/examples/startup-files (in the package bash-doc)
# for examples

# If not running interactively, don't do anything
case $- in
    *i*) ;;
      *) return;;
esac

# don't put duplicate lines or lines starting with space in the history.
# See bash(1) for more options
HISTCONTROL=ignoreboth

# append to the history file, don't overwrite it
shopt -s histappend

# for setting history length see HISTSIZE and HISTFILESIZE in bash(1)
HISTSIZE=1000
HISTFILESIZE=2000

# check the window size after each command and, if necessary,
# update the values of LINES and COLUMNS.
shopt -s checkwinsize

# If set, the pattern "**" used in a pathname expansion context will
# match all files and zero or more directories and subdirectories.
#shopt -s globstar

# make less more friendly for non-text input files, see lesspipe(1)
#[ -x /usr/bin/lesspipe ] && eval "$(SHELL=/bin/sh lesspipe)"

# set variable identifying the chroot you work in (used in the prompt below)
if [ -z "${debian_chroot:-}" ] && [ -r /etc/debian_chroot ]; then
    debian_chroot=$(cat /etc/debian_chroot)
fi

# set a fancy prompt (non-color, unless we know we "want" color)
case "$TERM" in
    xterm-color|*-256color) color_prompt=yes;;
esac

# uncomment for a colored prompt, if the terminal has the capability; turned
# off by default to not distract the user: the focus in a terminal window
# should be on the output of commands, not on the prompt
#force_color_prompt=yes

if [ -n "$force_color_prompt" ]; then
    if [ -x /usr/bin/tput ] && tput setaf 1 >&/dev/null; then
	# We have color support; assume it's compliant with Ecma-48
	# (ISO/IEC-6429). (Lack of such support is extremely rare, and such
	# a case would tend to support setf rather than setaf.)
	color_prompt=yes
    else
	color_prompt=
    fi
fi

if [ "$color_prompt" = yes ]; then
    PS1='${debian_chroot:+($debian_chroot)}\[\033[01;32m\]\u@\h\[\033[00m\]:\[\033[01;34m\]\w\[\033[00m\]\$ '
else
    PS1='${debian_chroot:+($debian_chroot)}\u@\h:\w\$ '
fi
unset color_prompt force_color_prompt

# If this is an xterm set the title to user@host:dir
case "$TERM" in
xterm*|rxvt*)
    PS1="\[\e]0;${debian_chroot:+($debian_chroot)}\u@\h: \w\a\]$PS1"
    ;;
*)
    ;;
esac

# enable color support of ls and also add handy aliases
if [ -x /usr/bin/dircolors ]; then
    test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
    alias ls='ls --color=auto'
    #alias dir='dir --color=auto'
    #alias vdir='vdir --color=auto'

    #alias grep='grep --color=auto'
    #alias fgrep='fgrep --color=auto'
    #alias egrep='egrep --color=auto'
fi

# colored GCC warnings and errors
#export GCC_COLORS='error=01;31:warning=01;35:note=01;36:caret=01;32:locus=01:quote=01'

# some more ls aliases
alias ll='ls -l'
alias la='ls -A'
alias l='ls -CF'

# Alias definitions.
# You may want to put all your additions into a separate file like
# ~/.bash_aliases, instead of adding them here directly.
# See /usr/share/doc/bash-doc/examples in the bash-doc package.

if [ -f ~/.bash_aliases ]; then
    . ~/.bash_aliases
fi

# enable programmable completion features (you don't need to enable
# this, if it's already enabled in /etc/bash.bashrc and /etc/profile
# sources /etc/bash.bashrc).
if ! shopt -oq posix; then
  if [ -f /usr/share/bash-completion/bash_completion ]; then
    . /usr/share/bash-completion/bash_completion
  elif [ -f /etc/bash_completion ]; then
    . /etc/bash_completion
  fi
fi


# To handle screen thing 
# => /etc/systemd/logind.conf -> Lid commands


git_branch() {
  git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/(\1)/'
}

#i3 connection nm-connection-editor
#nm-applet

# ==  Software ==

#firefox
alias firefox="~/software/firefox/firefox -search $1 &"

# = game =

#ftb
alias ftb="/opt/FTBA/FTBApp &"

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
export RUST="~/.cargo/bin"

#java - maven
alias jm="mvn clean install"
alias nmvn='function _(){ mvn -B archetype:generate -DgroupId=com.rolfie.$1 -DartifactId=$1 -DarchetypeArtifactId=maven-archetype-quickstart -DarchetypeVersion=1.4; }; _'
alias mvntest='function _(){ mvn -Dtest=$1 test; }; _'
export MAVEN_HOME="~/software/apache-maven-3.6.3/bin"

#haskell
export HASKELL_PATH="/opt/ghc/bin"
export GHCUP="/home/rolfie/.ghcup/env"
[ -f "/home/rolfie/.ghcup/env" ] && source "/home/rolfie/.ghcup/env" # ghcup-env

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

#system
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
alias us="setxkbmap us"
alias fr="setxkbmap fr"
alias dotfiles="cd ~/Documents/dotfiles"


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


export TERMINAL="alacritty"

export OWN_SOFTWARE="~/software/.sh:~/software/firefox/"

#minizinc
alias mzide="~/software/MiniZincIDE-2.5.1-bundle-linux-x86_64/MiniZincIDE.sh &"

#jetbrains 
#intellij
alias idea="~/software/idea-IU-202.6397.94/bin/idea.sh &"

#datagrip
alias datagrip="~/software/DataGrip-2020.2.2/bin/datagrip.sh &"

#path
export TEX_LIVE="/usr/local/texlive/2020/bin/x86_64-linux"

export PATH=$PATH:"/home/rolfie/.local/bin":$TEX_LIVE:$RUST:$MAVEN_HOME:$HASKELL_PATH:$JAVA_HOME:$OWN_SOFTWARE:$GHCUP:$TERMINAL
export PS1="\[\e]0;\u@\h: \w\a\]${debian_chroot:+($debian_chroot)}\[\033[01;32m\]\u@\h\[\033[00m\]:\[\033[01;34m\]\w\[\033[00m\]\$(git_branch)\$ "


#starship rust (always at end)
eval "$(starship init bash)"




