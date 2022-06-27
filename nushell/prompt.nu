source ~/.config/nushell/colors.nu

def create_left_prompt [] {
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

def create_right_prompt [] {
    if (ls -a | where type == dir && name == .git | empty?) == false {
      let branch = (git branch --show-current | str trim -c '')
      $"(ansi $rolfie_violet)git\((ansi $rolfie_red)($branch)(ansi $rolfie_violet)\)"
    } else {
      ""
    }
}

# Use nushell functions to define your right and left prompt
let-env PROMPT_COMMAND = { create_left_prompt }
let-env PROMPT_COMMAND_RIGHT = { create_right_prompt }

# The prompt indicators are environmental variables that represent
# the state of the prompt
let-env PROMPT_INDICATOR = { "〉" }
let-env PROMPT_INDICATOR_VI_INSERT = { ": " }
let-env PROMPT_INDICATOR_VI_NORMAL = { "〉" }
let-env PROMPT_MULTILINE_INDICATOR = { "::: " }
