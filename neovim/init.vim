filetype on
filetype indent on 
filetype plugin on

set number 
set relativenumber 
set termguicolors
"set background=dark
set encoding=UTF-8
set formatoptions-=cro                  " Stop newline continution of comments
set clipboard=unnamedplus               " Copy paste between vim and everything else
set cmdheight=2
set showtabline=2                       " Always show tabs
set tabstop=2                           " Insert 2 spaces for a tab
set shiftwidth=2                        " Change the number of space characters inserted for indentation
set colorcolumn=100
set expandtab
set smartindent
" === LSP ===
" Set completeopt to have a better completion experience
set completeopt=menu,menuone,noinsert,noselect " Avoid showing message extra message when using completion
set shortmess+=c
set noshowmode                          " We don't need to see things like -- INSERT -- anymore

"treesitter
set foldmethod=expr
set foldexpr=nvim_treesitter#foldexpr()
set fml=10
set fdl=2

let g:airline_powerline_fonts = 1
let g:airline_theme='wombat'
let g:rainbow_active = 1
let g:python_host_prog = "/usr/bin/python2"
let g:python3_host_prog = "/usr/local/bin/python3.8"

call plug#begin('~/.config/nvim/plugged')
"Completer and formatter
Plug 'neovim/nvim-lspconfig'
Plug 'RishabhRD/popfix'
Plug 'RishabhRD/nvim-lsputils'
Plug 'hrsh7th/nvim-compe'
Plug 'rust-lang/rust.vim'
Plug 'rhysd/vim-clang-format'

Plug 'hrsh7th/vim-vsnip'
Plug 'hrsh7th/vim-vsnip-integ'

Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
Plug 'nvim-treesitter/playground'
Plug 'nvim-treesitter/nvim-treesitter-refactor'
Plug 'nvim-treesitter/completion-treesitter'

"Git
Plug 'tpope/vim-fugitive'
Plug 'rbong/vim-flog'
Plug 'airblade/vim-gitgutter'
Plug 'Xuyuanp/nerdtree-git-plugin'

"System
Plug 'szw/vim-maximizer'
Plug 'nvim-lua/popup.nvim'
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'

"Tree
Plug 'scrooloose/nerdcommenter'
Plug 'scrooloose/nerdtree'
Plug 'mbbill/undotree'
Plug 'preservim/tagbar'

"colorscheme
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'sainnhe/gruvbox-material'
Plug 'morhetz/gruvbox'

"Fun
Plug 'ThePrimeagen/vim-be-good'

call plug#end()

colorscheme gruvbox-material
"colorscheme gruvbox

autocmd Filetype cpp,rust,python,typescript,java,haskell,lua,cs setlocal omnifunc=v:lua.vim.lsp.omnifunc

" === REMAPPING ===
"
" You can't stop me
cmap w!! w !sudo tee %
inoremap <C-c> <esc>
noremap <C-c> <esc>
noremap <leader>5 :vertical resize +5<CR>
noremap <leader>6 :vertical resize -5<CR>
vnoremap < <gv
vnoremap > >gv

"Open term in nvim
noremap <leader>t <C-w>s<C-w><C-p>:resize 10<CR>:ter<CR>

" Strange remapping I know
noremap l h
noremap ; l
noremap h ; 

noremap <C-w>l <C-w>h
noremap <C-w>; <C-w>l
noremap <C-w>h <C-w>;

" LSP 
inoremap <expr> <Tab>   pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"
imap <silent> <c-space> <Plug>(completion_trigger)
nmap <tab> <Plug>(completion_smart_tab)
nmap <s-tab> <Plug>(completion_smart_s_tab)

inoremap <silent><expr> <C-Space> compe#complete()
inoremap <silent><expr> <CR>      compe#confirm('<CR>')
inoremap <silent><expr> <C-e>     compe#close('<C-e>')

" Undotree
nnoremap <F5> :UndotreeToggle<cr>

" Tagbar
nmap <F8> :TagbarToggle<CR>

" Highlight
nnoremap <F1> :if AutoHighlightToggle()<Bar>set hls<Bar>endif<CR>

"NERDTree
nnoremap <silent> <space>e :NERDTree<cr>

"telescope vim
nnoremap <C-p> <cmd>Telescope find_files<cr>
nnoremap <leader>fg <cmd>Telescope live_grep<cr>
nnoremap <A-p> <cmd>Telescope buffers show_all_buffers=true<cr>
nnoremap <leader>fh <cmd>Telescope help_tags<cr>

command! -complete=file -nargs=* DebugC lua require "my_debug".start_c_debugger({<f-args>}, "gdb")
command! -complete=file -nargs=* DebugRust lua require "my_debug".start_c_debugger({<f-args>}, "gdb", "rust-gdb")

"lsp
lua package.loaded["my_lsp_config"] = nil
lua require("my_lsp_config")

"compe
lua package.loaded["my_compe_config"] = nil
lua require("my_compe_config")
"tree sitter
lua package.loaded["my_treesitter_config"] = nil
lua require("my_treesitter_config")

let g:completion_chain_complete_list = {
			\'default' : {
			\	'default' : [
			\		{'complete_items' : ['lsp', 'snippet']},
			\		{'mode' : 'file'}
			\	],
			\	'comment' : [],
			\	'string' : []
			\	},
			\'vim' : [
			\	{'complete_items': ['snippet']},
			\	{'mode' : 'cmd'}
			\	],
			\'c' : [
			\	{'complete_items': ['ts']}
			\	],
			\'python' : [
			\	{'complete_items': ['ts']}
			\	],
			\'lua' : [
			\	{'complete_items': ['ts']}
			\	],
			\}

"telescope
lua package.loaded["my_telescope_config"] = nil
lua require("my_telescope_config")


"font
if has('gui_running')
  set guifont=Mono Regular Nerd Font Complete
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

      au CursorHold * let @/ = '\V\<'.escape(expand('<cword>'), '\').'\>'
    augroup end
    setl updatetime=500
    echo 'Highlight current word: ON'
    return 1
  endif
endfunction

