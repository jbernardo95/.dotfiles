if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

call plug#begin('~/.vim/plugged')

Plug 'junegunn/vim-plug'

" editorconfig
Plug 'editorconfig/editorconfig-vim'

" Snippets 
Plug 'MarcWeber/vim-addon-mw-utils'
Plug 'tomtom/tlib_vim'
Plug 'garbas/vim-snipmate'
"Plug 'honza/vim-snippets'

" Auto completion
Plug 'ervandew/supertab'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
" coc sources used:
" coc-solargraph (Ruby, requires solargraph gem)
" coc-elixir (Elixir)
" coc-tsserver (Javascript)
" coc-json (json)
" coc-tabnine (all languages)

" ctrlp.vim
Plug 'kien/ctrlp.vim'

" ack.vim
Plug 'mileszs/ack.vim'

" airline
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

" surround
Plug 'tpope/vim-surround'

" tabular
Plug 'godlygeek/tabular'

" NERD Commenter
Plug 'scrooloose/nerdcommenter'

" NERD Tree
Plug 'scrooloose/nerdtree'

" ctags
Plug 'ludovicchabant/vim-gutentags'
Plug 'majutsushi/tagbar'

" git
Plug 'tpope/vim-fugitive'
Plug 'airblade/vim-gitgutter'
Plug 'christoomey/vim-conflicted'

" Gist
Plug 'mattn/webapi-vim'
Plug 'mattn/gist-vim'

" Multicursors
Plug 'terryma/vim-multiple-cursors'

" General languages support
Plug 'sheerun/vim-polyglot'

" Linting
Plug 'w0rp/ale'

" Colors
Plug 'chriskempson/vim-tomorrow-theme'

call plug#end()

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
set showmatch
set laststatus=2
set colorcolumn+=1
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
map <Leader>F y:Ack!<SPACE>'<C-R>"'<CR>
map <Leader>/ y/<C-R>"<CR>
map <leader>nt :NERDTree<CR>
map <leader>t :CtrlPTag<CR>
map <leader>tb :Tagbar<CR>
map <Leader>ct :!ctags ./<CR>
map <Leader>e :ALELint \| lopen <CR>
map <Leader>fn :call system('pbcopy', @%)<CR>
map <Leader>gd <Plug>(coc-definition)

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

" NERD Commenter
let g:NERDSpaceDelims = 1
let g:NERDDefaultAlign = 'left'
let g:NERDCommentEmptyLines = 1
let g:NERDTrimTrailingWhitespace = 1

" MacVim Only
if has("gui_running")
  set transparency=2

  " Font
  set guifont=Inconsolata:h17

  " GUI Options
  set guioptions=T
  set guioptions=m
endif
