nnoremap <C-p> <cmd>Files<cr>
nnoremap <leader>fg <cmd>Rg<cr>
nnoremap <C-u> <cmd>BuffersOnSteroids<cr>

function! s:buffers_action(lines)
    normal! m'

    let action = a:lines[1]
    let buf = split(a:lines[2])

    if action ==? 'ctrl-x'
      let bufname = split(buf[0], ':')[0]
      echo 'deleting buffer '.bufname
      execute 'bdelete '.bufname
    else
      let bufnumber = split(buf[2], ':')[0][1]
      execute 'b '.bufnumber
    endif
endfunction

function! s:buffers_on_steroids(query, fullscreen)
    let spec = { 'sink*': { lines -> s:buffers_action(lines) },
                \ 'options': [
                \   '--print-query',
                \   '--header', ':: <ctrl-x> to Close Buffer',
                \   '--prompt', 'Buffer> '
                \ ],
                \ 'placeholder': '{1}'
                \ }
    call fzf#vim#buffers(a:query, fzf#vim#with_preview(spec), a:fullscreen)
endfunction

" credit to: https://github.com/junegunn/fzf.vim/pull/733#issuecomment-1590442325
command! -bar -bang -nargs=? -complete=dir BuffersOnSteroids call s:buffers_on_steroids(<q-args>, <bang>0)
