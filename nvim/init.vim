filetype on
filetype indent on 
filetype plugin on

set number 
set relativenumber 
set termguicolors
set encoding=utf-8
set formatoptions-=cro                  " Stop newline continution of comments 
set clipboard=unnamedplus               " Copy paste between vim and everything else
set cmdheight=2
set showtabline=2                       " Always show tabs
set tabstop=2                           " Insert 2 spaces for a tab
set shiftwidth=2                        " Change the number of space characters inserted for indentation
set colorcolumn=100
set expandtab
set smartindent
set nohlsearch                          " no highlight on search
"set mouse=                              " WHO TF WANTS A MOUSE IN VIM

let g:python_host_prog = "/usr/bin/python2"
let g:python3_host_prog = "/usr/bin/python3.9"

let g:ftplugin_sql_omni_key = '<C-n>'  " remap vim's autocomplete for sql
let g:netrw_liststyle = 3

call plug#begin('~/Documents/dotfiles/nvim/plugged')
"Completer and formatter
Plug 'neovim/nvim-lspconfig'
Plug 'RishabhRD/popfix'
Plug 'RishabhRD/nvim-lsputils'
Plug 'hrsh7th/nvim-cmp'
Plug 'hrsh7th/cmp-nvim-lsp'
Plug 'hrsh7th/cmp-buffer'
Plug 'hrsh7th/cmp-path'
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
Plug 'scalameta/nvim-metals'
Plug 'mfussenegger/nvim-jdtls'
Plug 'elixir-editors/vim-elixir'
Plug 'rust-lang/rust.vim'

" Plug 'rhysd/vim-clang-format'
Plug 'lifepillar/pgsql.vim'

"Debugger
" Plug 'Shougo/vimproc.vim', {'do' : 'make'}
" Plug 'idanarye/vim-vebugger'

Plug 'hrsh7th/cmp-vsnip'
Plug 'hrsh7th/vim-vsnip'

"Git
Plug 'tpope/vim-fugitive'
Plug 'rbong/vim-flog'
Plug 'airblade/vim-gitgutter'

"System
Plug 'szw/vim-maximizer'
Plug 'nvim-lua/popup.nvim'
Plug 'nvim-lua/plenary.nvim'

Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'

Plug 'vim-test/vim-test'
Plug 'tricktux/pomodoro.vim'

"Tree
Plug 'mbbill/undotree'
Plug 'preservim/tagbar'

call plug#end()

colorscheme rolfie

source ~/.config/nvim/statusline.vim
source ~/.config/nvim/personal_functions.vim

source ~/.config/nvim/fzf.vim
source ~/.config/nvim/lsp.vim
" source ~/.config/nvim/vebugger.vim


" === REMAPPING ===
"
" You can't stop me
cmap w!! w !sudo tee %
inoremap <C-c> <esc>
noremap <C-c> <esc>
vnoremap < <gv
vnoremap > >gv

noremap <leader>y "*y
noremap <leader>p "*p

" Open term in nvim
noremap <leader>t <C-w>s<C-w><C-p>:resize 10<CR>:ter<CR>
" Quit term mod
tnoremap <leader>q <C-\><C-N>

" Strange remapping I know
noremap l h
noremap ; l
noremap h ; 

noremap <C-w>l <C-w>h
noremap <C-w>; <C-w>l
noremap <C-w>h <C-w>;

nnoremap <leader>j <cmd>cnext<CR>
nnoremap <leader>k <cmd>cprevious<CR>
nnoremap <leader>m <cmd>tabNext<CR>

nnoremap <silent> <space>e <cmd>Ex!<CR>

" Undotree
nnoremap <silent> <F5> :UndotreeToggle<cr>

" Git
nnoremap <F9> :Git<CR>
nnoremap <space><F9> :Git commit<CR>
nnoremap <F8> :TagbarToggle<CR>

function! SynStack()
  if !exists("*synstack")
    return
  endif
  echo map(synstack(line('.'), col('.')), 'synIDattr(v:val, "name")')
endfunc

