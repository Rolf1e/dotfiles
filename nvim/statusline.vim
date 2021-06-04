set laststatus=2
set statusline=
set statusline+=%{StatusLineLeft()} 
set statusline+=%=
set statusline+=%{LspStatus()}
set statusline+=%{StatusLineRight()} 

let s:exclude_status_line = ["netrw", "tagbar"]

function! StatusLineLeft() 
  if count(s:exclude_status_line, &filetype)
    return '[' . &filetype . ']:' . expand("%:~")
  endif

  let s:line =  StatuslineMode() . ' > ' . b:gitbranch . ': ' . expand("%:~")
  if &readonly
    return s:line . ':[RO]' 
  endif
  return s:line
endfunction

function! LspStatus()
  if count(s:exclude_status_line, &filetype)
    return ' '
  endif
  return 'lsp[E:' . s:LspStatus('Error') . ' W:' . s:LspStatus('Warning') . '] '
endfunction

function! s:LspStatus(...)
  let s:level = get(a:, 1, 0)
  return luaeval("vim.lsp.diagnostic.get_count(0, [[" . s:level . "]])")
endfunction

function! StatusLineRight() 
  if count(s:exclude_status_line, &filetype)
    return ''
  endif
  return ' | [' . &fileencoding . '] ' . &filetype . ' < ' . line('.') . '/' . line('$') . ' B:' . bufnr("%") 
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

