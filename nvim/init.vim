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

" === LSP ===
" Set completeopt to have a better completion experience
set completeopt=menu,menuone,noselect " Avoid showing message extra message when using completion
set shortmess+=c
set noshowmode                          " We don't need to see things like -- INSERT -- anymore

"treesitter
set foldmethod=expr
set foldexpr=nvim_treesitter#foldexpr()
set fml=10
set fdl=2

let g:airline_powerline_fonts = 1
let g:airline_theme='wombat'

let g:python_host_prog = "/usr/bin/python2"
let g:python3_host_prog = "/usr/local/bin/python3.8"

let g:netrw_liststyle = 3
let g:netrw_browse_split = 4
let g:netrw_altv = 1
let g:netrw_winsize = 15

call plug#begin('~/.config/nvim/plugged')
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

colorscheme gruvbox-material

let g:lualine = {
    \'options' : {
    \  'theme' : 'gruvbox_material',
    \  'section_separators' : ['', ''],
    \  'component_separators' : ['', ''],
    \  'icons_enabled' : v:false,
    \},
    \'sections' : {
    \  'lualine_a' : [ ['mode', {'upper': v:true,},], ],
    \  'lualine_b' : [ ['branch', {'icon': '',}, ], ],
    \  'lualine_c' : [ ['filename', {'file_status': v:true,},], ],
    \  'lualine_x' : [ 'encoding', 'fileformat', 'filetype' ],
    \  'lualine_y' : [],
    \  'lualine_z' : [ 'location'  ],
    \},
    \'inactive_sections' : {
    \  'lualine_a' : [  ],
    \  'lualine_b' : [  ],
    \  'lualine_c' : [ 'filename' ],
    \  'lualine_x' : [ 'location' ],
    \  'lualine_y' : [  ],
    \  'lualine_z' : [  ],
    \},
    \'extensions' : [ 'fzf' ],
    \}
lua require("lualine").setup{}

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
noremap <C-i> <cmd>bnext<CR>
noremap <C-o> <cmd>bprevious<CR>

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

" CommentLine
augroup comment_symbol
    autocmd!
    autocmd Filetype * let b:comment_leader = SelectSymbol()
augroup END
nnoremap <leader>q <C-c><cmd>call CommentLine()<CR>
vnoremap <leader>q <C-c><cmd>call CommentLine()<CR>

nnoremap <silent> <space>e <cmd>Sex!<CR>

"telescope vim
nnoremap <C-p> <cmd>Telescope find_files<cr>
nnoremap <leader>fg <cmd>Telescope live_grep<cr>
nnoremap <leader>g <cmd>Telescope git_status<cr>
nnoremap <A-p> <cmd>Telescope buffers show_all_buffers=true<cr>

"vebugger
nnoremap <leader>d <cmd>VBGcontinue<CR>
nnoremap <leader>e <cmd>VBGevalWordUnderCursor<CR>
nnoremap <leader>b <cmd>VBGtoggleBreakpointThisLine<CR>

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

"compe
lua require("my_compe_config")
"telescope
lua require("my_telescope_config")
"tree sitter
lua require("my_treesitter_config")

function! SelectSymbol()
  let python_like = ["python", "bash", "sh", "yaml"]
  if count(python_like, &filetype)
    return '# '
  endif

  let vim_like = ["vim"]
  if count(vim_like, &filetype)
    return '" '
  endif
  let lua_like = ["lua"]
  if count(lua_like, &filetype)
    return '-- '
  endif

  return '\/\/ '
endfunction

function! CommentLine() 
  if getline(".") =~ '^\s*' . b:comment_leader 
      " Uncomment the line
      execute "silent '<,'>s/^\\(\\s*\\)" . b:comment_leader . "/\\1/"
  else
      " Comment the line
      execute "silent '<,'>s/^\\(\\s*\\)/\\1" . b:comment_leader . "/"
  endif
endfunction

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

