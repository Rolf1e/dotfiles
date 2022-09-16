# Nushell Environment Config File

# Specifies how environment variables are:
# - converted from a string to a value on Nushell startup (from_string)
# - converted from a value back to a string when running external commands (to_string)
# Note: The conversions happen *after* config.nu is loaded
let-env ENV_CONVERSIONS = {
  "PATH": {
    from_string: { |s| $s | split row (char esep) }
    to_string: { |v| $v | str collect (char esep) }
  }
  "Path": {
    from_string: { |s| $s | split row (char esep) }
    to_string: { |v| $v | str collect (char esep) }
  }
}

# Directories to search for scripts when calling source or use
#
# By default, <nushell-config-dir>/scripts is added
let-env NU_LIB_DIRS = [
    ($nu.config-path | path dirname | path join 'scripts')
]

# Directories to search for plugin binaries when calling register
#
# By default, <nushell-config-dir>/plugins is added
let-env NU_PLUGIN_DIRS = [
    ($nu.config-path | path dirname | path join 'plugins')
]

# To add entries to PATH (on Windows you might use Path), you can use the following pattern:
# let-env PATH = ($env.PATH | prepend '/some/path')

# rust
let RUST = "~/.cargo/bin"

let PERSONAL_SOFTWARES = "/media/rolfie/ssd2/softwares"

let-env PATH = ($env.PATH | prepend [
    $RUST,
    $PERSONAL_SOFTWARES,
])

let-env WORKFLOW = 'home'

setup_workflow

source ~/.config/nushell/prompt.nu
source ~/.config/nushell/aliases.nu
source ~/.config/nushell/theme.nu
source ~/.config/nushell/completions.nu
source ~/.config/nushell/tmux.nu

def-env setup_workflow [] {
  let-env WORKFLOW_TMUX = if $env.WORKFLOW == 'cs' {
      $"($env.HOME)/.config/nushell/cs-tmux-session-config.yml"
  } else {
      $"($env.HOME)/.config/nushell/tmux-session-config.yml"
  }
}

