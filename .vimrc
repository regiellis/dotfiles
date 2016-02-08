" ----------------------------------------------------------------------------------------------------
" VIMRC PSONA IO
" ----------------------------------------------------------------------------------------------------

" ----------------------------------------------------------------------------------------------------
" set
" ----------------------------------------------------------------------------------------------------

set nocompatible
syntax enable
set term=screen-256color
color jellybeans

set autoindent
set autoread
set autowrite
set background=dark
set backspace=indent,eol,start
set clipboard+=unnamed
set colorcolumn=120
set copyindent
set directory-=.
set display+=lastline
set encoding=utf-8
set expandtab
set foldlevel=1
set foldmethod=indent
set foldnestmax=10
set guifont=Inconsolata\ for\ Powerline:h12
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
set noshowmode
set noswapfile
set nottimeout
set nowrap
set nowritebackup
set number
set ruler
set scrolloff=5
set shiftround
set shiftwidth=4
set shortmess+=I
set shortmess=atI
set showcmd
set showmatch
set smartcase
set smarttab
set softtabstop=4
set splitbelow
set splitright
set tabpagemax=15
set tabstop=4
set tags=.git/tags,tags
set textwidth=120
set tildeop
set title
set ttimeout
set undolevels=1000
set updatetime=100
set visualbell
set wildignore+=*/.git/*,*/.hg/*,*/.svn/*.,*/.DS_Store
set wildmenu
set wildmode=longest,list,full

" ----------------------------------------------------------------------------------------------------
" Respectively Stolen from myusuf3
" ----------------------------------------------------------------------------------------------------

" :iabbrev @@     regi@persona.io
" :iabbrev ccopy  Copyright 2015 Regi Ellis, All Rights Reserved.
" :iabbrev pdb    # XXX BREAKPOINT XXX <cr>import pdb; pdb.set_trace()
" :iabbrev !env   #!/usr/bin/env python <cr>#-*- coding: utf-8 -*-

" -----------------------------------------------------------------------------------------------------
"  Mouse Behave
" -----------------------------------------------------------------------------------------------------

set mouse=a
if exists('$TMUX')  " Support resizing in tmux
  set ttymouse=xterm2
endif


" ----------------------------------------------------------------------------------------------------
" Plug PluginList
" ----------------------------------------------------------------------------------------------------

filetype off
call plug#begin('~/.vim/bundle')
    "Plug 'SirVer/ultisnips'
    "Plug 'airblade/vim-gitgutter'
    "Plug 'cakebaker/scss-syntax.vim'
    "Plug 'groenewege/vim-less', { 'for': ['css', 'less'] }
    "Plug 'haya14busa/incsearch.vim'
    "Plug 'jaxbot/github-issues.vim'
    "Plug 'junegunn/vim-oblique'
    "Plug 'othree/javascript-libraries-syntax.vim', { 'for': 'javascript' }
    Plug 'FelikZ/ctrlp-py-matcher'
    Plug 'Lokaltog/vim-easymotion'
    Plug 'PeterRincker/vim-argumentative'
    Plug 'Raimondi/delimitMate'
    Plug 'Shougo/neocomplete.vim'
    Plug 'Wolfy87/vim-enmasse', { 'on': 'EnMasse' }
    Plug 'Wolfy87/vim-expand', { 'on': 'Expand' }
    Plug 'vim-airline/vim-airline'
    Plug 'vim-airline/vim-airline-themes'
    Plug 'digitaltoad/vim-jade', { 'for': ['jade'] }
    Plug 'ekalinin/Dockerfile.vim'
    Plug 'garbas/vim-snipmate'
    Plug 'geekjuice/vim-mocha'
    Plug 'gilgigilgil/anderson.vim'
    Plug 'godlygeek/tabular'
    Plug 'haya14busa/vim-asterisk'
    Plug 'helino/vim-json', { 'for': 'json' }
    Plug 'honza/vim-snippets'
    Plug 'jelera/vim-javascript-syntax', { 'for': 'javascript' }
    Plug 'jmcantrell/vim-virtualenv'
    Plug 'jmcomets/vim-pony'
    Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': 'yes \| ./install' }
    Plug 'junegunn/goyo.vim'
    Plug 'junegunn/limelight.vim'
    Plug 'junegunn/seoul256.vim'
    Plug 'junegunn/vim-easy-align'
    Plug 'junegunn/vim-peekaboo'
    Plug 'junegunn/vim-pseudocl'
    Plug 'justinj/vim-react-snippets'
    Plug 'kien/ctrlp.vim'
    Plug 'klen/python-mode'
    Plug 'lepture/vim-jinja'
    Plug 'majutsushi/tagbar'
    Plug 'marcweber/vim-addon-mw-utils'
    Plug 'marijnh/tern_for_vim', { 'do': 'npm install', 'for': 'javascript' }
    Plug 'mattn/emmet-vim'
    Plug 'mxw/vim-jsx', { 'for': 'jsx'}
    Plug 'myusuf3/numbers.vim'
    Plug 'nathanaelkane/vim-indent-guides'
    Plug 'pangloss/vim-javascript'
    Plug 'rizzatti/dash.vim'
    Plug 'rking/ag.vim'
    Plug 'scrooloose/nerdcommenter'
    Plug 'scrooloose/nerdtree'
    Plug 'scrooloose/syntastic'
    Plug 'sjl/gundo.vim', { 'on': 'GundoToggle' }
    Plug 'szw/vim-ctrlspace'
    Plug 'techlivezheng/vim-plugin-minibufexpl'
    Plug 'terryma/vim-multiple-cursors'
    Plug 'tomtom/tlib_vim'
    Plug 'tpope/vim-abolish'
    Plug 'tpope/vim-endwise'
    Plug 'tpope/vim-eunuch'
    Plug 'tpope/vim-fugitive'
    Plug 'tpope/vim-markdown', { 'for': 'md' }
    Plug 'tpope/vim-repeat'
    Plug 'tpope/vim-sleuth'
    Plug 'tpope/vim-surround'
    Plug 'tpope/vim-unimpaired'
    Plug 'tpope/vim-vinegar'
    Plug 'vim-scripts/SyntaxComplete'
call plug#end()
filetype plugin indent on

" ----------------------------------------------------------------------------------------------------
" let
" ----------------------------------------------------------------------------------------------------

" leader / global
let mapleader = ","
let g:numbers_exclude = ['tagbar', 'gundo', 'minibufexpl', 'nerdtree']
let g:closetag_filenames = "*.html"
let &colorcolumn=join(range(200,999),",")
let &colorcolumn="120,".join(range(160,999),",")
let g:user_emmet_leader_key='<c-z>'
let g:jsx_ext_required = 0 " Allow JSX in normal JS files
let g:syntastic_javascript_checkers = ['eslint']

" Solorized Color
let g:solarized_termcolors=256

" Powerline Symbols Config
let g:Powerline_symbols = 'fancy'

" Peekaboo
let g:peekaboo_window = 'vertical botright 50new'
let g:peekaboo_delay = 0
let g:peekaboo_compact = 1

" Argumentative
nmap [; <Plug>Argumentative_Prev
nmap ]; <Plug>Argumentative_Next
xmap [; <Plug>Argumentative_XPrev
xmap ]; <Plug>Argumentative_XNext
nmap <; <Plug>Argumentative_MoveLeft
nmap >; <Plug>Argumentative_MoveRight
xmap i; <Plug>Argumentative_InnerTextObject
xmap a; <Plug>Argumentative_OuterTextObject
omap i; <Plug>Argumentative_OpPendingInnerTextObject
omap a; <Plug>Argumentative_OpPendingOuterTextObject

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

" Limelight
nmap <Leader>l <Plug>(Limelight)
xmap <Leader>l <Plug>(Limelight)

" Goyo
autocmd User GoyoEnter Limelight
autocmd User GoyoLeave Limelight!

" Syntastic
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 0
let g:syntastic_check_on_wq = 0
let g:syntastic_mode_map = {'mode': 'active',
  \ 'active_filetypes': [],
  \ 'passive_filetypes': ['html', 'twig'] }

" Use flake8
let g:syntastic_python_checkers = ['flake8']
let g:syntastic_python_flake8_args = '--ignore="E501,E302,E261,E701,E241,E126,E127,E128,W801"'
let g:jsx_ext_required = 0 " Allow JSX in normal JS files
let g:syntastic_javascript_checkers = ['eslint']

" Better :sign interface symbols
let g:syntastic_error_symbol = '✗'
let g:syntastic_warning_symbol = '!'

" Multi Cursor
let g:multi_cursor_next_key='<C-n>'
let g:multi_cursor_prev_key='<C-p>'
let g:multi_cursor_skip_key='<C-x>'
let g:multi_cursor_quit_key='<Esc>'

" Python Mode"
let g:pymode_lint_write = 0
let g:pymode_options_colorcolumn = 0
let g:pymode_rope_goto_definition_bind = "<C-]>"
let g:pymode_run_bind = "<C-S-e>"
let g:pymode_doc_bind = "<C-S-d>"

" EasyMotion
let g:EasyMotion_smartcase = 1

" Airline
let g:airline#extensions#tabline#enabled=1
let g:airline_powerline_fonts=1
if !exists('g:airline_symbols')
    let g:airline_symbols={}
endif
let g:airline_symbols.space="\ua0"
let g:airline_theme="powerlineish"

" Symfony
let g:symfony_app_console_caller= "php"
let g:symfony_app_console_path= "app/console"

" Mocha
map <leader>mt :call RunCurrentSpecFile()<CR>
map <leader>ms :call RunNearestSpec()<CR>
map <leader>ml :call RunLastSpec()<CR>
map <leader>ma :call RunAllSpecs()<CR>

map ^[OA <up>
map ^[OB <down>
map ^[OC <right>
map ^[OD <left>

" NerdTree
map <leader>nt :NERDTreeToggle<cr>

" Neocomplete

let g:acp_enableAtStartup = 0
let g:neocomplete#enable_at_startup = 0
let g:neocomplete#enable_smart_case = 1
let g:neocomplete#sources#syntax#min_keyword_length = 3
" let g:neocomplete#lock_buffer_name_pattern = '\*ku\*'

let g:neocomplete#sources#dictionary#dictionaries = {
    \ 'default' : '',
    \ 'vimshell' : $HOME.'/.vimshell_hist',
    \ 'scheme' : $HOME.'/.gosh_completions'
    \ }

if !exists('g:neocomplete#keyword_patterns')
    let g:neocomplete#keyword_patterns = {}
endif
let g:neocomplete#keyword_patterns['default'] = '\h\w*'
imap <expr> <tab> emmet#expandAbbrIntelligent("\<tab>")
" ----------------------------------------------------------------------------------------------------
" maps
" ----------------------------------------------------------------------------------------------------

" Global
" nmap <S-Enter> O<Esc>
" nmap <CR> o<Esc>

" Easy Motion / GIF CONFIG
map  / <Plug>(easymotion-sn)
omap / <Plug>(easymotion-tn)
map <leader>j <Plug>(easymotion-j)
map <leader>k <Plug>(easymotion-k)
nmap <leader>s <Plugin>(eastmotion-s)

" NeoComplete
inoremap <silent> <CR> <C-r>=<SID>my_cr_function()<CR>
function! s:my_cr_function()
    return neocomplete#close_popup() . "\<CR>"
    " For no inserting <CR> key.
    "   "return pumvisible() ? neocomplete#close_popup() : "\<CR>"
 endfunction

inoremap <expr><TAB>  pumvisible() ? "\<C-n>" : "\<TAB>"
inoremap <expr><C-h> neocomplete#smart_close_popup()."\<C-h>"
inoremap <expr><BS> neocomplete#smart_close_popup()."\<C-h>"
inoremap <expr><C-y>  neocomplete#close_popup()
inoremap <expr><C-e>  neocomplete#cancel_popup()

" map <leader>t <C-p>
" map <leader>y :CtrlPBuffer<cr>
" map <leader>nt :NERDTreeToggle<cr>
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
nnoremap <leader>m :w <BAR> !lessc % > %:t:r.css<cr><space>
vmap <D-[> <gv
vmap <D-]> >gv

" ----------------------------------------------------------------------------------------------------
" highlight
" ----------------------------------------------------------------------------------------------------

highlight ColorColumn ctermbg=235 guibg=#2c2d27
highlight NonText ctermfg=darkgray ctermbg=none cterm=none
highlight SpecialKey ctermfg=darkgray ctermbg=none cterm=none
highlight Search ctermfg=yellow ctermbg=none cterm=bold,underline
highlight MatchParen cterm=bold ctermbg=none ctermfg=magenta

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
    " autocmd BufWritePre *.py,*.js :call <SID>Preserve()

    " Enable omni completion.
    autocmd FileType css setlocal omnifunc=csscomplete#CompleteCSS
    autocmd FileType html,markdown setlocal omnifunc=htmlcomplete#CompleteTags
    autocmd FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS
    autocmd FileType python setlocal omnifunc=pythoncomplete#Complete
    autocmd FileType xml setlocal omnifunc=xmlcomplete#CompleteTags
    autocmd FileType php setlocal omnifunc=phpcomplete#CompleteTags
    " Markdown
    autocmd BufRead,BufNewFile *.scss set filetype=scss.css
    autocmd FileType scss set iskeyword+=-
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
if executable('ag')
  " Use Ag over Grep
  set grepprg=ag\ --nogroup\ --nocolor
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

