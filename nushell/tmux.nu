# tmux

let TMUX_CONFIG_FILE = "/home/rolfie/.config/nushell/tmux-session-config.yml"

module tmux {

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

  def tmux_create_session [name, working_directory, command] {
    tmux new-session -d -s $name -c $working_directory -n $name $command
  }

  def tmux_create_windows [session_name] {
    get_windows_config $session_name 
    | each { | window |
      tmux_create_window $session_name $"($window | get name )" $"($window | get working_directory)" ($window | get command --ignore-errors | default 'nu')
    }
  }

  def tmux_create_window [session_name, name, working_directory, command] {
    tmux new-window -a -t $session_name -n $name -c $working_directory $command
  }

  def get_windows_config [name] {
    open $TMUX_CONFIG_FILE 
    | where name == $name 
    | get windows 
    | get 0 
  }

  def session_connect_completion [] {
    tmux list-session -F '#S'
    | lines 
    | each { |line| $line | str replace '[\*\+] ' '' | str trim }
  }

  # List tmux session registered in $TMUX_CONFIG_FILE
  export def tr [] {
    open $TMUX_CONFIG_FILE | get name
  }


  # List launched tmux session
  export def tl [] {
    tmux list-session
  }

  # Kill a tmux session
  export def tk [
    name: string # Session name
  ] {
    tmux kill-session -t $name
  }

  # Connect to a tmux session
  export def tc [
    name: string@session_connect_completion # Session name
  ] {
    tmux attach-session -t $name 
  }

  # Create tmux session from registered in $TMUX_CONFIG_FILE
  export def tmo [name: string@tr] {
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

}

use tmux *

