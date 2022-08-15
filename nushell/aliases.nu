alias :q = exit
alias cd.. = cd ..
alias .. = cd ..

alias dwn = cd ~/Downloads
alias doc = cd ~/Documents

#screen
alias pc_tower_mod = xrandr --output DP-1 --auto && xrandr --output DP-4 --off
alias pc_lap_top_mod = xrandr --output DP-4 --auto && xrandr --output DP-1 --off

#keyboard
alias us = setxkbmap us
alias fr = setxkbmap fr
alias wally = ~/software/wally &

alias rg = grep

alias vi = nvim
alias vim = nvim

alias dotfiles = tmo dotfiles

# docker
alias docker_stopall = docker stop $(docker ps -a -q) && docker rm -fv $(docker ps -aq)
alias docker_ip_find = docker inspect -f \ '{{range .NetworkSettings.Networks}}{{.IPAddress}}{{end}}'

alias mdev = sudo mount /dev/sdb1 /media/rolfie/ssd2 

def-env dev [dir?: string] { 
  cd $"/media/rolfie/ssd2/projects/($dir)"
}

def-env cours [dir?: string] { 
  cd $"/media/rolfie/ssd2/projects/cours/($dir)"
}

def tree_settings [depth: int, to_ignore?: string] {
	tree -a -L $depth -I $".git|.github|.vscode|.idea|*node_modules|*dist|*target|*__pycache__|($to_ignore)" --ignore-case
}

alias t3 = tree_settings 3
alias t2 = tree_settings 2
alias t1 = tree_settings 1
alias tn = tree_settings

alias mscn = mouse_screenshot
def mouse_screenshot [] {
  import ~/Documents/capture.png 
  cat ~/Documents/capture.png | xclip -selection clipboard -t image/png
}

def screenshot [] {
  import -window root ~/Documents/capture.png
  cat ~/Documents/capture.png | xclip -selection clipboard -t image/png
}


# == DEV == 

#git
alias gs = git status
alias gd = git diff
alias ga = git add
alias gc = git commit -m
alias gm = git commit -v
alias gp = git push
alias gco = git checkout
alias grm = git rm --cached -r 

alias ug = ungit &

#rust
alias cr = (clear; cargo run)
alias crb = RUST_BACKTRACE=1 cargo run
alias cb = (clear; cargo build)
alias cc = (clear; cargo clippy)
alias ct = (clear; cargo test)
alias ctb = RUST_BACKTRACE=1 cargo test -- --nocapture
alias cf = cargo fmt

def pdf [file: string] {
    lesspipe $file | bat; 
}
