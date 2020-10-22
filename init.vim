call plug#begin('~/.config/nvim/plugged')
"Completer
Plug 'neovim/nvim-lspconfig'
Plug 'RishabhRD/popfix'
Plug 'RishabhRD/nvim-lsputils'
Plug 'nvim-lua/completion-nvim'

"Git
Plug 'tpope/vim-fugitive'
Plug 'rbong/vim-flog'
Plug 'airblade/vim-gitgutter'

"System
Plug 'terryma/vim-multiple-cursors'
Plug 'scrooloose/syntastic'
Plug 'ryanoasis/vim-devicons'
Plug 'sheerun/vim-polyglot'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'

"Tree
Plug 'scrooloose/nerdcommenter'
Plug 'scrooloose/nerdtree'
Plug 'Xuyuanp/nerdtree-git-plugin'
Plug 'mbbill/undotree'

"Rust
Plug 'rust-lang/rust.vim'

"colorscheme
Plug 'flazz/vim-colorschemes'
Plug 'morhetz/gruvbox'
Plug 'vim-airline/vim-airline'
Plug 'sainnhe/forest-night'

"Fun
Plug 'ThePrimeagen/vim-be-good'
call plug#end()



" === REMAPPING ===

inoremap <C-c> <esc>
noremap <C-c> <esc>
"Open term in nvim
noremap <leader>t <C-w>s<C-w><C-p>:resize 10<CR>:ter<CR>

" Strange remapping I know
noremap l h
noremap ; l
noremap h ; 

" FZF 
noremap <C-p> :GFiles<CR>
noremap <leader>p :Files<CR>

" LSP 
nnoremap <silent> <c-]> <cmd>lua vim.lsp.buf.definition()<CR>
nnoremap <silent> K     <cmd>lua vim.lsp.buf.hover()<CR>
nnoremap <silent> gD    <cmd>lua vim.lsp.buf.implementation()<CR>
nnoremap <silent> <c-k> <cmd>lua vim.lsp.buf.signature_help()<CR>
nnoremap <silent> 1gD   <cmd>lua vim.lsp.buf.type_definition()<CR>
nnoremap <silent> gr    <cmd>lua vim.lsp.buf.references()<CR>
nnoremap <silent> g0    <cmd>lua vim.lsp.buf.document_symbol()<CR>
nnoremap <silent> gW    <cmd>lua vim.lsp.buf.workspace_symbol()<CR>
nnoremap <silent> gd    <cmd>lua vim.lsp.buf.declaration()<CR>
inoremap <expr> <Tab>   pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"
imap <silent> <c-space> <Plug>(completion_trigger)
nmap <tab> <Plug>(completion_smart_tab)
nmap <s-tab> <Plug>(completion_smart_s_tab)

" Undotree
nnoremap <F5> :UndotreeToggle<cr>

" Highlight
nnoremap <F3> :if AutoHighlightToggle()<Bar>set hls<Bar>endif<CR>

"NERDTree
nnoremap <silent> <space>e :NERDTree<cr>




"colorscheme 
let g:forest_night_transparent_background = 1
let g:airline_theme = 'forest_night'

let g:ycm_autoclose_preview_window_after_insertion = 0

filetype plugin indent on
filetype plugin on
"colorscheme 
colorscheme forest-night
set termguicolors
set background=dark
set encoding=UTF-8
set number
set smartindent
set autoindent
set relativenumber
set formatoptions-=cro                  " Stop newline continution of comments
set clipboard=unnamedplus               " Copy paste between vim and everything else
set showtabline=2                       " Always show tabs

" === LSP ===
" Set completeopt to have a better completion experience
set completeopt=menuone,noinsert,noselect
" Avoid showing message extra message when using completion
set shortmess+=c

autocmd Filetype rust,python,typescript setlocal omnifunc=v:lua.vim.lsp.omnifunc
" Use completion-nvim in every buffer
autocmd BufEnter * lua require'completion'.on_attach()

lua <<EOF
require'nvim_lsp'.rust_analyzer.setup({})
require'nvim_lsp'.tsserver.setup({})
require'nvim_lsp'.jedi_language_server.setup({})

require'nvim_lsp'.rust_analyzer.setup({on_attach=require'completion'.on_attach})
require'nvim_lsp'.tsserver.setup({on_attach=require'completion'.on_attach})

vim.lsp.callbacks['textDocument/codeAction'] = require'lsputil.codeAction'.code_action_handler
vim.lsp.callbacks['textDocument/references'] = require'lsputil.locations'.references_handler
vim.lsp.callbacks['textDocument/definition'] = require'lsputil.locations'.definition_handler
vim.lsp.callbacks['textDocument/declaration'] = require'lsputil.locations'.declaration_handler
vim.lsp.callbacks['textDocument/typeDefinition'] = require'lsputil.locations'.typeDefinition_handler
vim.lsp.callbacks['textDocument/implementation'] = require'lsputil.locations'.implementation_handler
vim.lsp.callbacks['textDocument/documentSymbol'] = require'lsputil.symbols'.document_handler
vim.lsp.callbacks['workspace/symbol'] = require'lsputil.symbols'.workspace_handler

local loc = require'lsputil.locations'
loc.key_maps['n']['gd'] = vim.lsp.buf.declaration()
EOF


if has('gui_running')
	set guifont=JetBrains Mono Regular Nerd Font Complete
endif


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
      au!
      au CursorHold * let @/ = '\V\<'.escape(expand('<cword>'), '\').'\>'
    augroup end
    setl updatetime=500
    echo 'Highlight current word: ON'
    return 1
  endif
endfunction

