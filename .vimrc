" .vimrc
" Creator - Joao Bernardo
" URL - https://github.com/jbernardo95/.dotfiles 

" Vundle BEGIN ------------------- 

set nocompatible              
filetype off                 

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Plugin 'gmarik/Vundle.vim'

" SnipMate
Plugin 'MarcWeber/vim-addon-mw-utils'
Plugin 'tomtom/tlib_vim'
Plugin 'garbas/vim-snipmate'
"Plugin 'honza/vim-snippets'

" Supertab
Plugin 'ervandew/supertab'

" ctrlp.vim
Plugin 'kien/ctrlp.vim'

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
Plugin 'majutsushi/tagbar'

" gitgutter
Plugin 'airblade/vim-gitgutter'

" Gist
Plugin 'mattn/webapi-vim'
Plugin 'mattn/gist-vim'

" General languages support
Plugin 'sheerun/vim-polyglot'

" JS support
Plugin 'mxw/vim-jsx'
Plugin 'isRuslan/vim-es6'

" elixir support
Plugin 'elixir-lang/vim-elixir'

Plugin 'tpope/vim-rails'

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

" Tabs and spaces
set expandtab " Tabs are spaces
set tabstop=2 " Number of visual spaces per TAB
set softtabstop=2 " Number of spaces a TAB counts for when editing
set shiftwidth=2 " Number of space characters inserted for indentation

" Custom file indentation
autocmd Filetype javascript setlocal tabstop=4 softtabstop=4 shiftwidth=4

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

" Font
set guifont=Inconsolata:h17

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

" Split
set splitbelow
set splitright

" Maps
map <Leader>r :%s/
map <leader>nt :NERDTree<CR>
map <leader>t :CtrlPTag<CR>
map <leader>tb :Tagbar<CR>
map <Leader>ct :!ctags ./<CR><CR>

" Disable Arrow Navigation
map <up> <nop>
map <down> <nop>
map <left> <nop>
map <right> <nop>

" gitgutter
let g:gitgutter_enabled=1

" airline
let g:airline_theme='tomorrow'
let g:airline#extensions#whitespace#enabled=0
let g:airline_left_sep=''
let g:airline_right_sep=''

"" The Silver Searcher
if executable('ag')
  " Use ag over grep
  set grepprg=ag\ --nogroup\ --nocolor

  " Use ag in CtrlP for listing files. Lightning fast and respects .gitignore
  let g:ctrlp_user_command = 'ag %s -l --nocolor -g ""'

  " ag is fast enough that CtrlP doesn't need to cache
  let g:ctrlp_use_caching = 0
endif

" MacVim Only
if has("gui_running")
  set transparency=2

  " GUI Options
  set guioptions=T
  set guioptions=m
endif
