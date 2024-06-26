set completeopt=menu,menuone,noselect   " Set completeopt to have a better completion experience
set shortmess+=c                        " Avoid showing message extra message when using completion
set noshowmode                          " We don't need to see things like -- INSERT -- anymore

inoremap <expr> <Tab>   pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"
imap <silent> <c-space> <Plug>(completion_trigger)

noremap <silent> gD <cmd>lua vim.lsp.buf.declaration()<CR>
noremap <silent> gd <cmd>lua vim.lsp.buf.definition()<CR>
noremap <silent> gi <cmd>lua vim.lsp.buf.implementation()<CR>
noremap <silent> gr <cmd>lua vim.lsp.buf.references()<CR>
noremap <silent> K <cmd>lua vim.lsp.buf.hover()<CR>
noremap <silent> <space>f <cmd>lua vim.lsp.buf.format { async = true }<CR>
noremap <silent> <leader>r <cmd>lua vim.lsp.buf.rename()<CR>
noremap <silent> <leader>i <cmd>lua vim.lsp.buf.code_action()<CR>
noremap <silent> <leader>u <cmd>lua vim.diagnostic.open_float()<CR>
noremap <silent> <leader>e <cmd>lua vim.diagnostic.setqflist()<CR>
noremap <silent> <leader>E <cmd>lua vim.diagnostic.setqflist({severity = "E"})<CR>
noremap <silent> <leader>W <cmd>lua vim.diagnostic.setqflist({severity = "W"})<CR>

lua require("my_compe_config")
lua require("my_lsp_config")

" colors
hi LspReferenceRead cterm=bold ctermbg=blue 
hi LspReferenceText cterm=bold ctermbg=blue 
hi LspReferenceWrite cterm=bold ctermbg=blue 

hi link LspDiagnosticsVirtualTextError       Red
hi link LspDiagnosticsVirtualTextWarning     Yellow
hi link LspDiagnosticsVirtualTextInformation Grey
hi link LspDiagnosticsVirtualTextHint        White
hi link LspCodeLens                          Red
hi link LspCodeLensSeparator                 Blue

augroup lsp_document_highlight
  autocmd!
  autocmd CursorHold <buffer> lua vim.lsp.buf.document_highlight()
  autocmd CursorMoved <buffer> lua vim.lsp.buf.clear_references()
augroup END

