set nocompatible              " be iMproved, required
set textwidth=120             " lines longer than 120 columns will be broken
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

Plugin 'rking/ag.vim'
Plugin 'scrooloose/nerdtree'
Plugin 'reedes/vim-thematic'
" Plugin 'Valloric/YouCompleteMe'
Plugin 'airblade/vim-gitgutter'
Plugin 'marijnh/tern_for_vim'

call vundle#end()            " required
syntax on
set background=dark
let g:solarized_termcolors=256

" To ignore plugin indent changes, instead use:
"
" Brief help
" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins; append `!` to update or just :PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal
"
" see :h vundle for more details or wiki for FAQ
" Put your non-Plugin stuff after this line
" autocmd vimenter * NERDTree
map <C-n> :NERDTreeToggle<CR>

autocmd StdinReadPre * let s:std_in=1
" autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTreeType") && b:NERDTreeType == "primary") | q | endif

python from powerline.vim import setup as powerline_setup
python powerline_setup()
python del powerline_setup
