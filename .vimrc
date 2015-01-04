set nocompatible              " be iMproved, required
set textwidth=79              " lines longer than 79 columns will be broken
set shiftwidth=4              " operation >> indents 4 columns; << unindents 4 columns
set tabstop=4                 " a hard TAB displays as 4 columns
set expandtab                 " insert spaces when hitting TABs
set softtabstop=4             " insert/delete 4 spaces when hitting a TAB/BACKSPACE
set shiftround                " round indent to multiple of 'shiftwidth'
set autoindent                " align the new line indent with the previous line

filetype off                  " required
filetype plugin indent on

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" All of your Plugins must be added before the following line
call vundle#end()            " required

call pathogen#infect()
call pathogen#helptags()
syntax on
set background=dark
colorscheme solarized
let g:solarized_termcolors=256

" To ignore plugin indent changes, instead use:
"
" Brief help
" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins; append `!` to update or just :PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal
"
" see :h vundle for more details or wiki for FAQ "
" Put your non-Plugin stuff after this line

set rtp+=~/Desktop/ASSETS/DEVELOPMENT/PYTHON/REPOS/powerline/powerline/bindings/vim
