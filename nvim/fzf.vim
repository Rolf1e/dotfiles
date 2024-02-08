nnoremap <C-p> <cmd>Files<cr>
nnoremap <leader>fg <cmd>Rg<cr>
nnoremap <C-u> <cmd>MyFzfBuffers<cr>

function! s:buffers_delete(lines)
    normal! m'
    let action = a:lines[1]
    if action !=? 'ctrl-x'
        return
    endif
    let buf=split(a:lines[2])[0]
    let bufname=split(buf, ':')[0]
    execute 'bdelete '.bufname
endfunction

function! s:myfzfbuffers(query, fullscreen)
    let close_buffer_header=':: <ctrl-x> to Close Buffer'
    let spec = { 'sink*': { lines -> s:buffers_delete(lines) },
                \ 'options': [
                \   '--print-query',
                \   '--header', close_buffer_header,
                \   '--prompt', 'Buffer> '
                \ ],
                \ 'placeholder': '{1}'
                \ }
    call fzf#vim#buffers(a:query, fzf#vim#with_preview(spec), a:fullscreen)
endfunction

" credit to: https://github.com/junegunn/fzf.vim/pull/733#issuecomment-1590442325
command! -bar -bang -nargs=? -complete=dir MyFzfBuffers call s:myfzfbuffers(<q-args>, <bang>0)
