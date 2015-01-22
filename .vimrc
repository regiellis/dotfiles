set nocompatible              " be iMproved, required
set textwidth=120             " lines longer than 120 columns will be broken
set shiftwidth=4              " operation >> indents 4 columns; << unindents 4 columns
set tabstop=4                 " a hard TAB displays as 4 columns
set expandtab                 " insert spaces when hitting TABs
set softtabstop=4             " insert/delete 4 spaces when hitting a TAB/BACKSPACE
set shiftround                " round indent to multiple of 'shiftwidth'
set autoindent                " align the new line indent with the previous line
set laststatus=2
set nobackup
set nowritebackup
set noswapfile
set history=1000
set ruler
set showcmd
set incsearch
set smartcase
set hidden
set backspace=indent,eol,start
set number
set background=dark
set list listchars=tab:▸\ ,eol:¬
set encoding=utf-8
set autoread
set clipboard+=unnamed
set shortmess+=I
set colorcolumn=0
set visualbell
set wildmenu
set lazyredraw
set showmatch
set ts=4 sts=4 sw=4 noexpandtab
let mapleader = ","

" CtrlP
map <leader>t <C-p>
map <leader>y :CtrlPBuffer<cr>
let g:ctrlp_show_hidden=1
let g:ctrlp_working_path_mode=0
let g:ctrlp_max_height=30
let g:ctrlp_arg_map = 1

let g:ctrlp_user_command = ['.git', 'cd %s && git ls-files . -co --exclude-standard', 'find %s -type f','ag %s -l --nocolor -g ""']
let g:ctrlp_use_caching = 0
" CtrlP -> files matched are ignored when expanding wildcards
set wildignore+=*/.git/*,*/.hg/*,*/.svn/*.,*/.DS_Store
"
" " CtrlP -> use Ag for searching instead of VimScript
" " (might not work with ctrlp_show_hidden and ctrlp_custom_ignore)
"
" " CtrlP -> directories to ignore when fuzzy finding
let g:ctrlp_custom_ignore = '\v[\/]((node_modules)|\.(git|svn|grunt|sass-cache))$'
"
" " Ack (uses Ag behind the scenes)
let g:ackprg = 'ag --nogroup --nocolor --column'

" Git gutter
let g:gitgutter_enabled = 1
let g:gitgutter_eager = 0
let g:gitgutter_sign_column_always = 1
" highlight clear SignColumn
"
" " Searching the file system
map <leader>' :NERDTreeToggle<cr>
let g:github_user='regiellis'
let g:github_comment_open_browser = 1

filetype off                  " required
set t_Co=256
" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Plugin 'rking/ag.vim'
Plugin 'scrooloose/nerdtree'
Plugin 'reedes/vim-thematic'
" Plugin 'Valloric/YouCompleteMe'
Plugin 'airblade/vim-gitgutter'
Plugin 'marijnh/tern_for_vim'
Plugin 'kien/ctrlp.vim'
Plugin 'rizzatti/dash.vim'
Plugin 'christoomey/vim-tmux-navigator'
Plugin 'kchmck/vim-coffee-script'
Plugin 'tpope/vim-markdown'
Plugin 'mattn/emmet-vim'
Plugin 'scrooloose/syntastic'
Plugin 'tpope/vim-surround'
Plugin 'scrooloose/nerdcommenter'
Plugin 'Lokaltog/vim-easymotion'
Plugin 'ervandew/supertab'
Plugin 'tpope/vim-repeat'
Plugin 'godlygeek/tabular'
Plugin 'klen/python-mode'
Plugin 'cburroughs/pep8.py'
Plugin 'pangloss/vim-javascript'
Plugin 'jelera/vim-javascript-syntax'
Plugin 'groenewege/vim-less'
Plugin 'othree/html5.vim'
Plugin 'hail2u/vim-css3-syntax'
Plugin 'leshill/vim-json'
Plugin 'cakebaker/scss-syntax.vim'
Plugin 'burnettk/vim-angular'
Plugin 'fs111/pydoc.vim'
Plugin 'derekwyatt/vim-scala'
Plugin 'Shougo/neocomplcache.vim'
Plugin 'mustache/vim-mustache-handlebars'
Plugin 'tpope/vim-commentary'
Plugin 'tpope/vim-rsi'
Plugin 'tpope/vim-endwise'
Plugin 'tpope/vim-fugitive'
Plugin 'tpope/vim-sleuth'
Plugin 'flazz/vim-colorschemes'
Plugin 'mmozuras/vim-github-comment'
Plugin 'mattn/webapi-vim'
Plugin 'moll/vim-node'
Plugin 'hallettj/jslint.vim'
Plugin 'walm/jshint.vim'
Plugin 'wavded/vim-stylus'
Plugin 'sjl/gundo'
call vundle#end()            " required
syntax on
let g:solarized_termcolors=256
let g:Powerline_symbols = 'fancy'
filetype plugin indent on
autocmd BufNewFile,BufReadPost *.md set filetype=markdown
" let g:neocomplcache_enable_at_startup = 1
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
nmap <leader>l :set list!<CR>
let g:pymode_options_colorcolumn = 0
" hi ColorColumn ctermbg=8
highlight NonText guifg=#4a4a59
highlight SpecialKey guifg=#4a4a59
let g:netrw_liststyle=3
autocmd BufWinEnter * highlight ColorColumn ctermbg=darkred
autocmd FileType vim-plug setl colorcolumn=0
autocmd StdinReadPre * let s:std_in=1
" autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTreeType") && b:NERDTreeType == "primary") | q | endif


" Set tabstyle and tabstops based on file type
if has("autocmd")
    
    "Javascript/HTML/CSS
    autocmd FileType html setlocal ts=4 sts=4 sw=4 expandtab
    autocmd FileType css setlocal ts=4 sts=4 sw=4 expandtab
    autocmd Filetype javascript setlocal ts=4 sts=4 sw=4 noexpandtab

    "Python
    autocmd FileType python setlocal ts=4 sts=4 sw=4 expandtab
    " autocmd BufWritePre *.py,*.js :call <SID>StripTrailingWhitespaces()
endif
  nnoremap <silent> <F5> :call <SID>Preserve()<CR>
function! Preserve(command)
  " Preparation: save last search, and cursor position.
  let _s=@/
  let l = line(".")
  let c = col(".")
  " Do the business:
  execute a:command
  " Clean up: restore previous search history, and cursor position
  let @/=_s
  call cursor(l, c)
endfunction 
nmap _$ :call Preserve("%s/\\s\\+$//e")<CR>
nmap _= :call Preserve("normal gg=G")<CR>

nmap <D-[> <<
nmap <D-]> >>
vmap <D-[> <gv
vmap <D-]> >gv
map <D-S-]> gt
map <D-S-[> gT
map <D-1> 1gt
map <D-2> 2gt
map <D-3> 3gt
map <D-4> 4gt
map <D-5> 5gt
map <D-6> 6gt
map <D-7> 7gt
map <D-8> 8gt
map <D-9> 9gt
map <D-0> :tablast<CR>

python from powerline.vim import setup as powerline_setup
python powerline_setup()
python del powerline_setup
