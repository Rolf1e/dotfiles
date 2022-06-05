# tmux
alias tc = tmux_connect
alias tl = tmux_list_session
alias tk = tmux_kill
alias tmo = open_tmux_session

let TMUX_CONFIG_FILE = "/home/rolfie/.config/nushell/tmux-session-config.yml"

def open_tmux_session [name] {
  let whole_config = open $TMUX_CONFIG_FILE 

  if ($whole_config | where name == $name | empty?) {
    echo $"Tmux session ($name) was not found"
  } else {
    
    let working_directory = get_working_directory $name
    let command = get_command $name

    tmux_create_session $name $working_directory $command

    echo $"Creating tmux session ($name) in ($working_directory)"

    tmux_create_windows $name
  }

}

def get_command [name] {
  open $TMUX_CONFIG_FILE 
  | where name == $name 
  | get enter_command 
  | get 0
}

def get_working_directory [name] {
  open $TMUX_CONFIG_FILE 
  | where name == $name 
  | get working_directory 
  | get 0
}

def tmux_list_session [] {
  tmux list-session
}

def tmux_connect [name] {
  tmux attach-session -t $name 
}

def tmux_kill [name] {
  tmux kill-session -t $name
}

def tmux_create_session [name, working_directory, command] {
  tmux new-session -d -s $name -c $working_directory -n $name $command
}

def tmux_create_windows [session_name] {
  get_windows_config $session_name | each { | window | 
    tmux new-window -a -t $session_name -n $"($window | get name )" -c $"($window | get working_directory)"
  }
}

def get_windows_config [name] {
  open $TMUX_CONFIG_FILE | where name == $name | get windows | get 0 
}

