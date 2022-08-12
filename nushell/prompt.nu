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
          $"(ansi $rolfie_blue)($env.PWD)(ansi reset)"
        } else {
          let short_path_segment = [
            $"/($path_segment | get ($path_len - 3))",
            $"/($path_segment | get ($path_len - 2))",
            $"/($path_segment | get ($path_len - 1))",
          ]

          $"(ansi $rolfie_blue)($short_path_segment | str collect)(ansi reset)"
        }

      } else {
          $"(ansi $rolfie_blue)~(ansi reset)"
      }
  }

  export def create_right_prompt [] {
    $"(git_prompt)" # (battery_prompt)"
  }

  def git_prompt [] {
      if (ls -a | where type == dir && name == .git | empty?) == false {
        let branch = (git branch --show-current | str trim -c '')
        $"(ansi $rolfie_violet)git\((ansi $rolfie_red)($branch)(ansi $rolfie_violet)\)"
      } else {
        ""
      }
  }

  def battery_prompt [] {
    let battery_full = (cat $"($BATTERY_FOLDER)($BATTERY_FULL_FILE)" | into int)
    echo $battery_full
    let battery_now = (cat $"($BATTERY_FOLDER)($BATTERY_NOW_FILE)" | into int)
    $"(($battery_now) * 100 / ($battery_full))%"
  }
}

use prompt *

# Use nushell functions to define your right and left prompt
let-env PROMPT_COMMAND = { create_left_prompt }
let-env PROMPT_COMMAND_RIGHT = { create_right_prompt }

# The prompt indicators are environmental variables that represent
# the state of the prompt
let-env PROMPT_INDICATOR = { "〉" }
let-env PROMPT_INDICATOR_VI_INSERT = { ": " }
let-env PROMPT_INDICATOR_VI_NORMAL = { "〉" }
let-env PROMPT_MULTILINE_INDICATOR = { "::: " }
