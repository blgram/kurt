"=====================Plugin Management======================
set nocompatible
filetype off

" set the runtime path to include Vundle and Initialize:
set rtp+=$HOME/.vim/bundle/Vundle.vim/
call vundle#begin('$HOME/.vim/bundle/')

Plugin 'tpope/vim-fugitive'
Plugin 'preservim/nerdtree'

Plugin 'Xuyuanp/nerdtree-git-plugin'
Plugin 'tiagofumo/vim-nerdtree-syntax-highlight'

Plugin 'ervandew/supertab'
Plugin 'tpope/vim-dispatch'
"Plugin 'joshdick/onedark.vim'

"Python icin gerekli olan Pluginler
Plugin 'altercation/vim-colors-solarized'
Plugin 'davidhalter/jedi-vim'
Plugin 'nvie/vim-flake8'
Plugin 'vim-airline/vim-airline'
Plugin 'ctrlpvim/ctrlp.vim'
Plugin 'tmhedberg/simpylfold'
Plugin 'vim-syntastic/syntastic'
Plugin 'google/yapf'
Plugin 'majutsushi/tagbar'
Plugin 'jmcantrell/vim-virtualenv'
Plugin 'yuttie/comfortable-motion.vim'
Plugin 'garbas/vim-snipmate'
Plugin 'MarcWeber/vim-addon-mw-utils'
Plugin 'tomtom/tlib_vim'
"All of your Plugin Must be Added before here ==============
call vundle#end()
filetype plugin indent on
let g:coc_global_extensions=[ 'coc-omnisharp' ]

"===============General Config=============================
highlight EndOfBuffer ctermfg=black ctermbg=black
set encoding=UTF-8              " Set the right char encoding for icons
set scrolloff=5                 " Keep 5 lines below and above the cursor
set ruler                       " Display line and column number in bottom
syntax enable                   " Activate syntax highlighting.
set autoread                    " Reload files changed outside vim
set laststatus=2                " Statusbar
set showcmd 		        " Show (partial) command in status line.
set showmatch                   " Show matching brackets.
set ignorecase                  " Do case insensitive matching
set smartcase                   " Do smart case matching
set incsearch                   " Incremental search
set autowrite                   " Automatically save before commands like
set hidden                      " Hide buffers when they are abandoned
"=============== DARKONE Config ===================

" Display options
"set showmode
"set showcmd

"Set a nice theme.
"color darkblue 
"
syntax enable
set background=dark
colorscheme solarized

let g:solarized_termcolors=256
"================ NERDTree Config ====================
"Navigation keybindings
map <silent> <F5> :NERDTreeToggle<CR>
"UI minimization
let NERDTreeMinimalUI = 1      "Hide the help indicator
let NERDTreeDirArrows = 1

"Git indication
let g:NERDTreeGitStatusNodeColorization = 1

"NERDTREE Auto open when no file is selected
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif
" ================= PowerLine Configuration ==================="

"let g:airline#extensions#tabline#enabled = 1

" ================= Folding and Shit =====================
set foldmethod=indent
set foldlevel=99
nnoremap <space> za

au BufNewFile,BufRead *.py
    \ set tabstop=4 |
    \ set softtabstop=4 |
    \ set shiftwidth=4 |
    \ set textwidth=79 |
    \ set expandtab |
    \ set autoindent |
    \ set fileformat=unix

au BufNewFile,BufRead *.js, *.html, *.css
    \ set tabstop=2|
    \ set softtabstop=2|
    \ set shiftwidth=2
"let python_highlight_all=1  " whitespace ise bunu sil. goruntuyu bozuyor.
syntax on

nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

set splitbelow
set splitright

autocmd BufWinLeave *.* mkview
autocmd BufWinEnter *.* silent loadview

nmap <F6> :TagbarToggle<CR>

" =========== Run Python3 File ====================
noremap <buffer> <F10> :exec '!python3 -m pdb' shellescape(@%, 1)<cr>
nnoremap <buffer> <F9> :exec '!python3' shellescape(@%, 1)<cr>
" ================== Syntastic Ayarlari ========================
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*
