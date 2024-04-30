set laststatus=2
set statusline=
set statusline+=%{StatusLineLeft()} 
set statusline+=%=
set statusline+=%{StatusLineLspStatus()}
set statusline+=%{StatusLineRight()} 

let s:exclude_status_line = ["netrw", "tagbar", "Outline"]

function! StatusLineLeft() 
  if count(s:exclude_status_line, &filetype)
    return '[' . &filetype . ']:' . expand("%:t")
  endif

  let s:line =  StatuslineMode() . ' > ' . b:gitbranch . ': ' . expand("%:t")
  if &readonly
    return s:line . ':[RO]' 
  endif
  return s:line
endfunction

function! StatusLineLspStatus()
  if count(s:exclude_status_line, &filetype)
    return ' '
  endif
  return 'lsp[E:' . len(s:StatusLineLspStatus('ERROR')) . ' W:' . len(s:StatusLineLspStatus('WARN')) . '] '
endfunction

function! s:StatusLineLspStatus(...)
  let s:level = get(a:, 1, 0)
  return luaeval("vim.diagnostic.get(0, { severity = vim.diagnostic.severity." . s:level . " })")
endfunction

function! StatusLineRight() 
  if count(s:exclude_status_line, &filetype)
    return ''
  endif
  return '[' . pomo#status_bar() . '] ' . line('.') . '/' . line('$') . ' B:' . bufnr("%") 
endfunction

function! StatuslineMode()
  let l:mode=mode()
  if l:mode==#"n"
    return "NORMAL"
  elseif l:mode==?"v"
    return "VISUAL"
  elseif l:mode==#"i"
    return "INSERT"
  elseif l:mode==#"R"
    return "REPLACE"
  elseif l:mode==?"s"
    return "SELECT"
  elseif l:mode==#"t"
    return "TERMINAL"
  elseif l:mode==#"c"
    return "COMMAND"
  elseif l:mode==#"!"
    return "SHELL"
  endif
endfunction

function! StatuslineGitBranch()
  let b:gitbranch=""
  if !executable("git") 
    return
  endif

  if &modifiable
    try
      let l:dir=expand('%:p:h')
      let l:gitrevparse = system("git -C ".l:dir." rev-parse --abbrev-ref HEAD")
      if !v:shell_error
        let b:gitbranch="(".substitute(l:gitrevparse, '\n', '', 'g').")"
      endif
    catch
    endtry
  endif
endfunction

augroup GetGitBranch
  autocmd!
  autocmd VimEnter,WinEnter,BufEnter * call StatuslineGitBranch()
augroup END

