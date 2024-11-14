source ~/.config/nushell/colors.nu


let BATTERY_FOLDER = '/sys/class/power_supply/BAT0'
let BATTERY_NOW_FILE = '/energy_now'
let BATTERY_FULL_FILE = '/energy_full'

module prompt {

  export def create_left_prompt [] {
      if $env.PWD != $env.HOME {
        
        let path_segment = ($env.PWD | split row '/')
        let path_len = ($path_segment | length)
        if $path_len <= 3 {
          $"(date_prompt) (ansi $rolfie_blue)($env.PWD)(ansi reset)"
        } else {
          let short_path_segment = [
            $"($path_segment | get ($path_len - 3))",
            $"($path_segment | get ($path_len - 2))",
            $"($path_segment | get ($path_len - 1))",
          ] | str join "/"

          $"(date_prompt) (ansi $rolfie_blue)($short_path_segment)(ansi reset)"
        }

      } else {
          $"(date_prompt) (ansi $rolfie_blue)~(ansi reset)"
      }
  }

  export def create_right_prompt [] {
    $"(git_prompt) (workflow_prompt)" 
  }

  def date_prompt [] {
    $"(ansi $rolfie_light_grey)(date now | format date '%I:%M:%S')"
  }

  def workflow_prompt [] {
    $"(ansi $rolfie_green)[($env.WORKFLOW)](ansi reset)"
  }

  def git_prompt [] {
    let is_git = do { git status } | complete  | get exit_code
    if 0 == $is_git {
       let branch = (git branch --show-current | str trim -c '')
       $"(ansi $rolfie_violet)git\((ansi $rolfie_red)($branch)(ansi $rolfie_violet)\)"
    } else { "" }
  }

}

use prompt *

# Use nushell functions to define your right and left prompt
$env.PROMPT_COMMAND = { || create_left_prompt }
$env.PROMPT_COMMAND_RIGHT = { || create_right_prompt }

# The prompt indicators are environmental variables that represent
# the state of the prompt
$env.PROMPT_INDICATOR = { "> " }
$env.PROMPT_INDICATOR_VI_INSERT = { ": " }
$env.PROMPT_INDICATOR_VI_NORMAL = { "> " }
$env.PROMPT_MULTILINE_INDICATOR = { "::: " }
