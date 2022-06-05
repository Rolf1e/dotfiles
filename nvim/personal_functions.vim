" Tmux Creator
nnoremap <F4> <cmd>TmuxCreatorRegisteredSession<CR>
nnoremap <F6> <cmd>TmuxCreatorListSession<CR>
" CommentLine
augroup comment_symbol
    autocmd!
    autocmd Filetype * let b:comment_leader = SelectSymbol()
augroup END
nnoremap <leader>q <C-c><cmd>call CommentLine()<CR>
vnoremap <leader>q <C-c><cmd>call CommentLine()<CR>

function! SyntaxGroup()                                                            
    let l:s = synID(line('.'), col('.'), 1)                                       
    echo synIDattr(l:s, 'name') . ' -> ' . synIDattr(synIDtrans(l:s), 'name')
endfun

nnoremap <F12> <cmd>call SyntaxGroup()<CR> 

function! SelectSymbol()
  let python_like = ["python", "bash", "sh", "yaml", "dockerfile", "toml", "elixir", "conf"]
  if count(python_like, &filetype)
    return '# '
  endif

  let latex_like = ["tex"]
  if count(latex_like, &filetype)
    return '% '
  endif

  let vim_like = ["vim"]
  if count(vim_like, &filetype)
    return '" '
  endif

  let lua_like = ["lua"]
  if count(lua_like, &filetype)
    return '-- '
  endif

  return '\/\/ '
endfunction

function! CommentLine() 
  if getline(".") =~ '^\s*' . b:comment_leader 
      " Uncomment the line
      execute "silent '<,'>s/^\\(\\s*\\)" . b:comment_leader . "/\\1/"
  else
      " Comment the line
      execute "silent '<,'>s/^\\(\\s*\\)/\\1" . b:comment_leader . "/"
  endif
endfunction

" Highlight
nnoremap <F1> :if AutoHighlightToggle()<Bar>set hls<Bar>endif<CR>

" Highlight all instances of word under cursor, when idle.
" Useful when studying strange source code.
" Type z/ to toggle highlighting on/off.
function! AutoHighlightToggle()
  let @/ = ''
  if exists('#auto_highlight')
    au! auto_highlight
    augroup! auto_highlight
    setl updatetime=4000
    echo 'Highlight current word: off'
    return 0
  else
    augroup auto_highlight

      au CursorHold * let @/ = '\V\<'.escape(expand('<cword>'), '\').'\>'
    augroup end
    setl updatetime=500
    echo 'Highlight current word: ON'
    return 1
  endif
endfunction
