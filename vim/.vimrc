execute pathogen#infect()

set nocompatible
set encoding=utf-8

filetype plugin on
syntax enable
set t_Co=256
let g:solarized_termcolors=256
set background=dark
colorscheme solarized

au BufRead,BufNewFile *.scss set filetype=css
au BufRead,BufNewFile *.md set filetype=markdown

filetype plugin indent on
set expandtab
set shiftwidth=2
set tabstop=2
set softtabstop=2
set shiftround
set nowrap

set scrolloff=3
set sidescrolloff=5
set sidescroll=1
set backspace=indent,eol,start
set whichwrap=h,l,b,<,>,~,[,]
set iskeyword-=_

set laststatus=2
set showmode
set showcmd
set modeline
set ruler
set title

set number

if exists("+colorcolumn")
  set colorcolumn=81
endif

set cursorline
set nohlsearch
set incsearch
set ignorecase
set smartcase

if $VIM_CRONTAB == "true"
  set nobackup
  set nowritebackup
endif
