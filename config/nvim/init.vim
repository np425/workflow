set nocompatible
filetype off

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Plugin 'VundleVim/Vundle.vim'
Plugin 'morhetz/gruvbox'

call vundle#end()
filetype plugin indent on

set background=dark

let g:gruvbox_contrast_dark='hard'
let g:gruvbox_italic=1
let $NVIM_TUI_ENABLE_TRUE_COLOR=1

autocmd vimenter * ++nested colorscheme gruvbox

syntax on

set number
set relativenumber

filetype plugin indent on

set tabstop=4
set shiftwidth=4
set expandtab
