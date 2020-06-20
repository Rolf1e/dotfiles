":help key-notation

call plug#begin('~/AppData/Local/nvim/plugged')

Plug 'scrooloose/nerdtree'
Plug 'tiagofumo/vim-nerdtree-syntax-highlight'
Plug 'scrooloose/nerdcommenter'
Plug 'ryanoasis/vim-devicons'

Plug 'neovimhaskell/haskell-vim'
Plug 'eagletmt/neco-ghc'

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
syntax on
filetype plugin indent on
let g:ycm_semantic_triggers = {'haskell' : ['.']}
let g:haskellmode_completion_ghc = 0
autocmd FileType haskell setlocal omnifunc=necoghc#omnifunc
let g:necoghc_enable_detailed_browse = 1

" GruvBox - Material
colorscheme gruvbox
set termguicolors
set background=dark

" nerdtree
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif
let g:coc_disable_startup_warning = 1
set encoding=UTF-8
filetype plugin on
" Show lines numbers
set number
"font
"
if has('gui_running')
	set guifont=JetBrains Mono Regular Nerd Font Complete
endif

" YCM
fun! GoYCM()
	nnoremap <buffer> <silent> <leader>gd :YCMCompleter GoTo<CR>
	nnoremap <buffer> <silent> <leader>gr :YCMCompleter GoToReferences<CR>
	nnoremap <buffer> <silent> <F1> :YcmCompleter GetDoc<CR>
endfun

autocmd FileType java,rust,cpp,hpp,h,cxx,c,typescript :call GoYCM()

let g:ycm_autoclose_preview_window_after_insertion = 0

fun! Compile()
	nnoremap <buffer> <silent> <F2> :YcmDiags<CR><C-w><C-p>
endfun

autocmd FileType java,rust :call Compile()


