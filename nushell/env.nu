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

#fzf
let FZF_DEFAULT_COMMAND = 'rg --files --hidden --follow --no-ignore-vcs'
let FZF_CTRL_T_COMMAND = "$FZF_DEFAULT_COMMAND"
let FZF_DEFAULT_OPTS = '--height 96% --reverse --preview "cat {}"'

let-env PATH = ($env.PATH | prepend [
    $RUST,

    $FZF_CTRL_T_COMMAND, 
    $FZF_DEFAULT_COMMAND,
    $FZF_DEFAULT_OPTS,

])

source ~/.config/nushell/prompt.nu
source ~/.config/nushell/aliases.nu
source ~/.config/nushell/theme.nu
source ~/.config/nushell/completions.nu


let-env WORKFLOW = 'content-square'

setup_workflow

source ~/.config/nushell/tmux.nu
source ~/.config/nushell/contentsquare.nu

def-env setup_workflow [] {
  let-env WORKFLOW_TMUX = if $env.WORKFLOW == "content-square" {
      echo "Launched with Content Square workflow"
      overlay use content_square
      $"($env.HOME)/.config/nushell/cs-tmux-session-config.yml"
  } else {
      echo "Launched with Personal workflow"
      $"($env.HOME)/.config/nushell/tmux-session-config.yml"
  }
}

