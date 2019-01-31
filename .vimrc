" .vimrc
" Creator - Joao Bernardo
" URL - https://github.com/jbernardo95/.dotfiles

" Vundle BEGIN -------------------

set nocompatible
filetype off

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Plugin 'gmarik/Vundle.vim'

" editorconfig
Plugin 'editorconfig/editorconfig-vim'

" Snippets 
Plugin 'MarcWeber/vim-addon-mw-utils'
Plugin 'tomtom/tlib_vim'
Plugin 'garbas/vim-snipmate'
"Plugin 'honza/vim-snippets'

" Supertab
Plugin 'ervandew/supertab'

" ctrlp.vim
Plugin 'kien/ctrlp.vim'

" ack.vim
Plugin 'mileszs/ack.vim'

" airline
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'

" surround
Plugin 'tpope/vim-surround'

" tabular
Plugin 'godlygeek/tabular'

" NERD Commenter
Plugin 'scrooloose/nerdcommenter'

" NERD Tree
Plugin 'scrooloose/nerdtree'

" ctags
Plugin 'ludovicchabant/vim-gutentags'
Plugin 'majutsushi/tagbar'

" git
Plugin 'tpope/vim-fugitive'
Plugin 'airblade/vim-gitgutter'
Plugin 'christoomey/vim-conflicted'

" Gist
Plugin 'mattn/webapi-vim'
Plugin 'mattn/gist-vim'

" Multicursors
Plugin 'terryma/vim-multiple-cursors'

" General languages support
Plugin 'sheerun/vim-polyglot'

Plugin 'tpope/vim-rails'

" Linting
Plugin 'w0rp/ale'

" Colors
Plugin 'chriskempson/vim-tomorrow-theme'
Plugin 'ajh17/Spacegray.vim'

call vundle#end()
filetype plugin indent on
filetype plugin on

" Vundle END -----------------------

" General
set encoding=utf-8
set termencoding=utf-8
set autoread
set backspace=eol,start,indent
set whichwrap+=<,>,h,l
set updatetime=500

" Tabs and spaces
set expandtab " Tabs are spaces
set tabstop=2 " Number of visual spaces per TAB
set softtabstop=2 " Number of spaces a TAB counts for when editing
set shiftwidth=2 " Number of space characters inserted for indentation

" Custom file indentation
autocmd Filetype javascript setlocal tabstop=4 softtabstop=4 shiftwidth=4
autocmd Filetype erlang setlocal tabstop=4 softtabstop=4 shiftwidth=4

" Identation
set autoindent
set smartindent
set smarttab
set copyindent

" UI
set number
"set relativenumber
set showmatch
set laststatus=2
autocmd VimResized * :wincmd =

" Font
" terminal vim uses the same font as the terminal

" Colors
colorscheme Tomorrow-Night
syntax on
highlight Normal ctermbg=232426 " Match terminal background

" Autocomplete in command line
set showcmd
set wildmenu
set wildmode=longest,full
if exists("&wildignorecase")
  set wildignorecase
endif

" Searching
set incsearch " Search as characters are entered
set hlsearch " Highlight search results
set ignorecase

" Tags
set tags=.tags
let g:gutentags_ctags_tagfile = ".tags"

" Split
set splitbelow
set splitright

" Maps
map <Leader>r :%s/
map <Leader>f :Ack!<SPACE>
map <leader>nt :NERDTree<CR>
map <leader>t :CtrlPTag<CR>
map <leader>tb :Tagbar<CR>
map <Leader>ct :!ctags ./<CR>
map <Leader>e :ALELint \| lopen <CR>
map <Leader>fn :call system('pbcopy', @%)<CR>

" Disable Arrow Navigation
map <up> <nop>
map <down> <nop>
map <left> <nop>
map <right> <nop>

" editorconfig
let g:EditorConfig_exclude_patterns = ['fugitive://.*']

" gitgutter
let g:gitgutter_enabled = 1
highlight GitGutterAdd    guifg=#009900 guibg=#1a1b1d ctermfg=2 ctermbg=232426
highlight GitGutterChange guifg=#009900 guibg=#1a1b1d ctermfg=3 ctermbg=232426
highlight GitGutterDelete guifg=#009900 guibg=#1a1b1d ctermfg=1 ctermbg=232426

" airline
let g:airline_theme = 'tomorrow'
let g:airline_left_sep = ''
let g:airline_right_sep = ''
let g:airline#extensions#whitespace#enabled = 0
let g:airline#extensions#ale#enabled = 1

" The Silver Searcher
if executable('ag')
  " Use ag over grep
  set grepprg=ag\ --nogroup\ --nocolor

  " Use ag in CtrlP for listing files. Lightning fast and respects .gitignore
  let g:ctrlp_user_command = 'ag %s -l --nocolor -g ""'

  " ag is fast enough that CtrlP doesn't need to cache
  let g:ctrlp_use_caching = 0

  " Use ag in ack.vim
  let g:ackprg = 'ag --vimgrep'
endif

" Set ack.vim quickfix window size
let g:ack_qhandler = "botright copen 15"

" Javascript
let g:javascript_plugin_flow = 1
let g:jsx_ext_required = 0

" ale
let g:ale_echo_msg_format = '[%linter%] %s'
let g:ale_sign_error = '*'
let g:ale_sign_warning = '*'
highlight ALEErrorSign ctermfg=Red guifg=Red
highlight ALEWarningSign ctermfg=Yellow guifg=Yellow
let g:ale_linters = {
\ 'html': [],
\}

" MacVim Only
if has("gui_running")
  set transparency=2

  " Font
  set guifont=Inconsolata:h17

  " GUI Options
  set guioptions=T
  set guioptions=m
endif
