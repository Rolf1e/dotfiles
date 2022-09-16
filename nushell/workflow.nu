let-env WORKFLOW_TMUX = if $env.WORKFLOW == 'cs' {
  $"($env.HOME)/.config/nushell/cs-tmux-session-config.yml"
} else {
  $"($env.HOME)/.config/nushell/tmux-session-config.yml"
}
