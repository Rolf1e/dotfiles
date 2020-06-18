call plug#begin('~/AppData/Local/nvim/plugged')

Plug 'scrooloose/nerdtree'
Plug 'tiagofumo/vim-nerdtree-syntax-highlight'
Plug 'ryanoasis/vim-devicons'
Plug 'neovimhaskell/haskell-vim'
Plug 'ycm-core/YouCompleteMe'
Plug 'morhetz/gruvbox'
"Plug 'gruvbox-material/vim', {'as': 'gruvbox-material'}
"Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'tpope/vim-fugitive'
Plug 'airblade/vim-gitgutter'
Plug 'vim-airline/vim-airline'

Plug 'lervag/vimtex'

Plug 'kien/ctrlp.vim'
call plug#end()

" Haskell 

" GruvBox - Material
colorscheme gruvbox
set termguicolors
set background=dark

" nerdtree
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif
let g:coc_disable_startup_warning = 1
set encoding=UTF-8
" Show lines numbers
set number
"font
"
if has('gui_running')
  set guifont=JetBrains Mono Regular Nerd Font Complete
endif

