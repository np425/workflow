set nocompatible

call plug#begin()

Plug 'gruvbox-community/gruvbox'
Plug 'rust-lang/rust.vim'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'junegunn/fzf'

call plug#end()

filetype plugin indent on

set background=dark

let g:gruvbox_contrast_dark='hard'
let g:gruvbox_italic=1
let $NVIM_TUI_ENABLE_TRUE_COLOR=1

set termguicolors

" autocmd vimenter * ++nested colorscheme gruvbox
colorscheme gruvbox

syntax on

set number
set relativenumber

filetype plugin indent on

set tabstop=4
set shiftwidth=4
set expandtab
