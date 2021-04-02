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

let g:python_host_prog = "/usr/bin/python2"
let g:python3_host_prog = "/usr/local/bin/python3.8"


call plug#begin('~/Documents/dotfiles/nvim/plugged')
"Completer and formatter
Plug 'neovim/nvim-lspconfig'
Plug 'RishabhRD/popfix'
Plug 'RishabhRD/nvim-lsputils'
Plug 'hrsh7th/nvim-compe'
Plug 'rust-lang/rust.vim'
Plug 'rhysd/vim-clang-format'
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
Plug 'nvim-treesitter/playground'
Plug 'nvim-treesitter/nvim-treesitter-refactor'
Plug 'nvim-treesitter/completion-treesitter'
Plug 'mfussenegger/nvim-jdtls'

"Debugger
Plug 'Shougo/vimproc.vim', {'do' : 'make'}
Plug 'idanarye/vim-vebugger'

"Git
Plug 'tpope/vim-fugitive'
Plug 'rbong/vim-flog'
Plug 'airblade/vim-gitgutter'

"System
Plug 'szw/vim-maximizer'
Plug 'nvim-lua/popup.nvim'
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim'
"
"Tree
Plug 'mbbill/undotree'
Plug 'preservim/tagbar'

"colorscheme
Plug 'hoob3rt/lualine.nvim'
Plug 'kyazdani42/nvim-web-devicons'
Plug 'sainnhe/gruvbox-material'

Plug 'tjdevries/nlua.nvim'
"Fun
Plug 'ThePrimeagen/vim-be-good'

Plug '/media/rolfie/ssd2/projects/tmux-creator'
call plug#end()

source ~/.config/nvim/net_rw.vim
source ~/.config/nvim/treesitter.vim
source ~/.config/nvim/lsp.vim
source ~/.config/nvim/telescope.vim
source ~/.config/nvim/vebugger.vim
source ~/.config/nvim/lualine.vim
source ~/.config/nvim/personal_functions.vim

"transparent
let g:gruvbox_material_transparent_background = 1
augroup GruvboxMaterialCustom
  autocmd!
  autocmd ColorScheme gruvbox-material highlight Normal guibg=None ctermbg=None
augroup END

colorscheme gruvbox-material

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
tnoremap <leader>q <C-\><C-N>

" Strange remapping I know
noremap l h
noremap ; l
noremap h ; 

noremap <C-w>l <C-w>h
noremap <C-w>; <C-w>l
noremap <C-w>h <C-w>;

nnoremap <leader>k <cmd>cnext<CR>
nnoremap <leader>j <cmd>cprevious<CR>

nnoremap <silent> <space>e <cmd>Sex!<CR>

" Undotree
nnoremap <F5> :UndotreeToggle<cr>
" Tagbar
nmap <F8> :TagbarToggle<CR>

