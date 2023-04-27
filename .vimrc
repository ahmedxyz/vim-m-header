" Use vim-plug to manage plugins
call plug#begin('~/.vim/plugins')
Plug 'sainnhe/everforest'
call plug#end()

" Enable syntax highlighting, filetype detection, and indent settings
syntax enable
filetype plugin indent on

" Enable true colors in the terminal (if supported)
if has('termguicolors')
    set termguicolors
endif

" Set the background color to dark and use a hard (solid) background color
set background=dark
let g:everforest_background='hard'
let g:everforest_transparent_background=1

" Mheader plugin variables
let g:uniqname='ahmedxyz'
let g:email='ahmedxyz@umich.edu'

" Enable incremental search and highlight search results
set incsearch
set hlsearch

" Set terminal bold and reverse highlighting (if supported)
let &t_ZH="\e[3m"
let &t_ZR="\e[23m"

" Set the colorscheme
colorscheme everforest

" Set tab settings
set tabstop=4
set softtabstop=4
set shiftwidth=4
set expandtab

" Set indentation settings
autocmd FileType c,cpp,java,php set cindent
autocmd FileType * set smartindent

" Set HTML tab settings
autocmd FileType html,htm setlocal tabstop=2 shiftwidth=2 softtabstop=2

" Set other options
set mouse=a
set ruler
set colorcolumn=81
set number
set nocompatible
set nobackup
set scrolloff=10
set nowrap
set showmode
