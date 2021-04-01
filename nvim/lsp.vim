" === LSP ===
" Set completeopt to have a better completion experience
set completeopt=menu,menuone,noselect " Avoid showing message extra message when using completion
set shortmess+=c
set noshowmode                          " We don't need to see things like -- INSERT -- anymore

inoremap <expr> <Tab>   pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"
imap <silent> <c-space> <Plug>(completion_trigger)
nmap <tab> <Plug>(completion_smart_tab)
nmap <s-tab> <Plug>(completion_smart_s_tab)

inoremap <silent><expr> <C-Space> compe#complete()
inoremap <silent><expr> <CR>      compe#confirm('<CR>')
inoremap <silent><expr> <C-e>     compe#close('<C-e>')

"compe
lua require("my_compe_config")
"lsp
lua require("my_lsp_config")
" jdtls
if has('nvim-0.5')
  augroup lsp
    au!
    au FileType java lua require('jdtls').start_or_attach({cmd = {'/home/rolfie/.config/nvim/java-jdtls.sh'}, root_dir = require('jdtls.setup').find_root({'gradle.build', 'pom.xml'})})
  augroup end
endif
command! -buffer JdtCompile lua require('jdtls').compile()
