
command! -nargs=0 TmuxListSessions call s:tmux_list_sessions()

function! s:tmux_list_sessions()
  let res = system("tmux list-session")

  if empty(res)
    throw "Failed to call list tmux sessions"
  endif

  echo res
endfunction
