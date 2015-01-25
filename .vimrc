" ----------------------------------------------------------------------------------------------------
" VIMRC PSONA IO
" ----------------------------------------------------------------------------------------------------

" ----------------------------------------------------------------------------------------------------
" set
" ----------------------------------------------------------------------------------------------------

set nocompatible
filetype off
syntax enable
colorscheme Tomorrow-Night

set autoindent
set autoread
set autowrite
set background=dark
set backspace=indent,eol,start
set clipboard+=unnamed
set colorcolumn=120
set copyindent
set encoding=utf-8
set expandtab
set foldlevel=1
set foldmethod=indent
set foldnestmax=10
set hidden
set history=1000
set hlsearch
set ignorecase
set incsearch
set laststatus=2
set lazyredraw
set list 
set listchars=tab:▸\ ,eol:¬
set nobackup
set nofoldenable
set noswapfile
set nowrap
set nowritebackup
set number
set ruler
set shiftround
set shiftwidth=4
set shortmess+=I
set showcmd
set showmatch
set showmode
set smartcase
set smarttab
set softtabstop=4
set tabpagemax=15
set tabstop=4
set term=screen-256color
set textwidth=120
set title
set undolevels=1000
set visualbell
set wildignore+=*/.git/*,*/.hg/*,*/.svn/*.,*/.DS_Store
set wildmenu

" ----------------------------------------------------------------------------------------------------
" Respectively Stolen from myusuf3
" ----------------------------------------------------------------------------------------------------

" :iabbrev @@     regi@persona.io
" :iabbrev ccopy  Copyright 2015 Regi Ellis, All Rights Reserved.
" :iabbrev pdb    # XXX BREAKPOINT XXX <cr>import pdb; pdb.set_trace()
" :iabbrev !env   #!/usr/bin/env python <cr>#-*- coding: utf-8 -*-

" ----------------------------------------------------------------------------------------------------
" Vundle PluginList
" ----------------------------------------------------------------------------------------------------

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
  "Plugin 'honza/vim-snippets'
  Plugin 'bling/vim-airline'
  Plugin 'Lokaltog/vim-easymotion'
  Plugin 'Shougo/neocomplcache.vim'
  Plugin 'Shougo/neocomplete.vim'
  Plugin 'SirVer/ultisnips'
  Plugin 'airblade/vim-gitgutter'
  Plugin 'alvan/vim-closetag'
  Plugin 'burnettk/vim-angular'
  Plugin 'cakebaker/scss-syntax.vim'
  Plugin 'cburroughs/pep8.py'
  Plugin 'christoomey/vim-tmux-navigator'
  Plugin 'derekwyatt/vim-scala'
  Plugin 'docker/docker'
  Plugin 'ervandew/supertab'
  Plugin 'fs111/pydoc.vim'
  Plugin 'godlygeek/tabular'
  Plugin 'groenewege/vim-less'
  Plugin 'hail2u/vim-css3-syntax'
  Plugin 'hallettj/jslint.vim'
  Plugin 'jaxbot/semantic-highlight.vim'
  Plugin 'jelera/vim-javascript-syntax'
  Plugin 'kchmck/vim-coffee-script'
  Plugin 'kien/ctrlp.vim'
  Plugin 'klen/python-mode'
  Plugin 'laurentgoudet/vim-howdoi'
  Plugin 'leshill/vim-json'
  Plugin 'majutsushi/tagbar'
  Plugin 'marijnh/tern_for_vim'
  Plugin 'mattn/emmet-vim'
  Plugin 'mattn/webapi-vim'
  Plugin 'mmozuras/vim-github-comment'
  Plugin 'moll/vim-node'
  Plugin 'mustache/vim-mustache-handlebars'
  Plugin 'myusuf3/numbers.vim'
  Plugin 'othree/html5.vim'
  Plugin 'othree/javascript-libraries-syntax.vim'
  Plugin 'pangloss/vim-javascript'
  Plugin 'reedes/vim-thematic'
  Plugin 'rizzatti/dash.vim'
  Plugin 'rking/ag.vim'
  Plugin 'rstacruz/sparkup'
  Plugin 'scrooloose/nerdcommenter'
  Plugin 'scrooloose/nerdtree'
  Plugin 'scrooloose/syntastic'
  Plugin 'sjl/gundo.vim'
  Plugin 'skammer/vim-css-color'
  Plugin 'terryma/vim-multiple-cursors'
  Plugin 'tpope/vim-commentary'
  Plugin 'tpope/vim-endwise'
  Plugin 'tpope/vim-fugitive'
  Plugin 'tpope/vim-markdown'
  Plugin 'tpope/vim-repeat'
  Plugin 'tpope/vim-rsi'
  Plugin 'tpope/vim-sleuth'
  Plugin 'tpope/vim-surround'
  Plugin 'vim-scripts/SyntaxComplete'
  Plugin 'vim-scripts/snipMate'
  Plugin 'walm/jshint.vim'
  Plugin 'wavded/vim-stylus'
call vundle#end()
filetype plugin indent on

" ----------------------------------------------------------------------------------------------------
" let
" ----------------------------------------------------------------------------------------------------

" leader
let mapleader = ","

" CtrlP -> use Ag for searching instead of VimScript
let g:ctrlp_custom_ignore = '\v[\/]((node_modules)|\.(git|svn|grunt|sass-cache))$'
let g:ctrlp_show_hidden=1
let g:ctrlp_working_path_mode=0
let g:ctrlp_max_height=30
let g:ctrlp_arg_map = 1
let g:ctrlp_user_command = ['.git', 'cd %s && git ls-files . -co --exclude-standard', 'find %s -type f','ag %s -l --nocolor -g ""']
let g:ackprg = 'ag --nogroup --nocolor --column'
let g:ctrlp_use_caching = 0

let s:semanticGUIColors = [ '#72d572', '#c5e1a5', '#e6ee9c', '#fff59d', '#ffe082', '#ffcc80', '#ffab91', '#bcaaa4', '#b0bec5', '#ffa726', '#ff8a65', '#f9bdbb', '#f9bdbb', '#f8bbd0', '#e1bee7', '#d1c4e9', '#ffe0b2', '#c5cae9', '#d0d9ff', '#b3e5fc', '#b2ebf2', '#b2dfdb', '#a3e9a4', '#dcedc8' , '#f0f4c3', '#ffb74d' ]
let g:semanticTermColors = [28,1,2,3,4,5,6,7,25,9,10,34,12,13,14,15,16,125,124,19]

" Git gutter
let g:gitgutter_enabled = 1
let g:gitgutter_eager = 0
let g:gitgutter_sign_column_always = 1
let g:github_user='regiellis'
let g:github_comment_open_browser = 1

" Syntastic
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0

" Color
let g:solarized_termcolors=256
let g:Powerline_symbols = 'fancy'

" let g:neocomplcache_enable_at_startup = 1
let g:pymode_options_colorcolumn = 0
let g:netrw_liststyle=3

" Numbers
let g:numbers_exclude = ['tagbar', 'gundo', 'minibufexpl', 'nerdtree']

" ultisnip
let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsJumpForwardTrigger="<c-b>"
let g:UltiSnipsJumpBackwardTrigger="<c-z>"

" Python Mode"
let g:pymode_lint_write = 0


" Airline
let g:airline#extensions#tabline#enabled=1


let &colorcolumn=join(range(200,999),",")
let &colorcolumn="120,".join(range(160,999),",")
" ----------------------------------------------------------------------------------------------------
" map
" ----------------------------------------------------------------------------------------------------

map <leader>t <C-p>
map <leader>y :CtrlPBuffer<cr>
map <leader>nt :NERDTreeToggle<cr>
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
map <D-0> :tablast<cr>


nmap <leader>l :set list!<cr>
nmap _$ :call Preserve("%s/\\s\\+$//e")<cr>
nmap _= :call Preserve("normal gg=G")<cr>
nmap <D-[> <<
nmap <D-]> >>
nmap <F8> :TagbarToggle<cr>

nnoremap ; :
nnoremap <silent> <F5> :call <SID>Preserve()<cr>
nnoremap <leader>s :SemanticHighlightToggle<cr>
nnoremap <cr> :noh<cr><cr>

vmap <D-[> <gv
vmap <D-]> >gv

" ----------------------------------------------------------------------------------------------------
" highlight
" ----------------------------------------------------------------------------------------------------

highlight ColorColumn ctermbg=234
highlight NonText ctermfg=darkgray ctermbg=none cterm=none
highlight SpecialKey ctermfg=darkgray ctermbg=none cterm=none
highlight Search ctermfg=yellow ctermbg=none cterm=bold,underline

highlight clear SignColumn
highlight GitGutterAdd ctermfg=green
highlight GitGutterChange ctermfg=yellow
highlight GitGutterDelete ctermfg=red
highlight GitGutterChangeDelete ctermfg=yellow

" ----------------------------------------------------------------------------------------------------
" autocmd
" ----------------------------------------------------------------------------------------------------

if has("autocmd")

    " Javascript/HTML/CSS
    autocmd FileType html setlocal ts=4 sts=4 sw=4 expandtab
    autocmd FileType css setlocal ts=4 sts=4 sw=4 expandtab
    autocmd Filetype javascript setlocal ts=4 sts=4 sw=4 expandtab
    autocmd BufReadPre *.js let b:javascript_lib_use_jquery = 1
    autocmd BufReadPre *.js let b:javascript_lib_use_underscore = 1
    autocmd BufReadPre *.js let b:javascript_lib_use_backbone = 1
    autocmd BufReadPre *.js let b:javascript_lib_use_prelude = 0
    autocmd BufReadPre *.js let b:javascript_lib_use_angularjs = 1
    autocmd BufReadPre *.js let b:javascript_lib_use_jasmine = 1
    autocmd BufReadPre *.js let b:javascript_lib_use_chai = 1
    autocmd BufReadPre *.js let b:javascript_lib_use_requirejs = 1
    " autocmd BufWritePre *.py,*.js :call <SID>Preserve()

    " Markdown
    autocmd BufNewFile,BufReadPost *.md set filetype=markdown

    " Python
     autocmd FileType python setlocal ts=4 sts=4 sw=4 expandtab
     autocmd StdinReadPre * let s:std_in=1
    " autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif
    " autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTreeType") && b:NERDTreeType == "primary") | q | endif
endif

if has("autocmd") && exists("+omnifunc")
  autocmd Filetype *
        \   if &omnifunc == "" |
        \       setlocal omnifunc=syntaxcomplete#Complete |
        \   endif
endif

" ----------------------------------------------------------------------------------------------------
" functions
" ----------------------------------------------------------------------------------------------------

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

function! OpenChangedFiles()
    only " Close all windows, unless they're modified
    let status = system('git status -s | grep "^ \?\(M\|A\|UU\)" | sed "s/^.\{3\}//"')
    let filenames = split(status, "\n")
    exec "edit " . filenames[0]
    for filename in filenames[1:]
        exec "sp " . filename
    endfor
endfunction
command! OpenChangedFiles :call OpenChangedFiles()
" ----------------------------------------------------------------------------------------------------
" powerline status
" ----------------------------------------------------------------------------------------------------

python from powerline.vim import setup as powerline_setup
python powerline_setup()
python del powerline_setup

