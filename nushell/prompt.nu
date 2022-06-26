source ~/.config/nushell/colors.nu

def create_left_prompt [] {
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

}

def create_right_prompt [] {
    let time_segment = ([
        (date now | date format '%m/%d/%Y %r')
    ] | str collect)

    $time_segment
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
