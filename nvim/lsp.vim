set completeopt=menu,menuone,noselect   " Set completeopt to have a better completion experience
set shortmess+=c                        " Avoid showing message extra message when using completion
set noshowmode                          " We don't need to see things like -- INSERT -- anymore

inoremap <expr> <Tab>   pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"
imap <silent> <c-space> <Plug>(completion_trigger)
nmap <tab> <Plug>(completion_smart_tab)
nmap <s-tab> <Plug>(completion_smart_s_tab)

inoremap <silent><expr> <C-Space> compe#complete()
inoremap <silent><expr> <CR>      compe#confirm('<CR>')
inoremap <silent><expr> <C-e>     compe#close('<C-e>')

noremap <silent> gD <cmd>lua vim.lsp.buf.declaration()<CR>
noremap <silent> gd <cmd>lua vim.lsp.buf.definition()<CR>
noremap <silent> K <cmd>lua vim.lsp.buf.hover()<CR>
noremap <silent> gi <cmd>lua vim.lsp.buf.implementation()<CR>
noremap <silent> <leader>i <cmd>lua vim.lsp.buf.code_action()<CR>
noremap <silent> grr <cmd>lua vim.lsp.buf.rename()<CR>
noremap <silent> gr <cmd>lua vim.lsp.buf.references()<CR>
noremap <silent> <space>f <cmd>lua vim.lsp.buf.formatting()<CR>


" Enable type inlay hints
" autocmd CursorMoved,InsertLeave,BufEnter,BufWinEnter,TabEnter,BufWritePost *
" \ lua require'lsp_extensions'.inlay_hints{ prefix = '', highlight = "Comment", enabled = {"TypeHint", "ChainingHint", "ParameterHint"} }

lua require("my_compe_config")
lua require("my_lsp_config")

" jdtls
if has('nvim-0.5')
  augroup lsp
    au!
    au FileType java lua require('jdtls').start_or_attach({cmd = {'/home/rolfie/.config/nvim/java-jdtls.sh'}, root_dir = require('jdtls.setup').find_root({'gradle.build', 'pom.xml'})})
  augroup end
endif
command! -buffer JdtCompile lua require('jdtls').compile()
