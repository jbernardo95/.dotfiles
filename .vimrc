if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

call plug#begin('~/.vim/plugged')

Plug 'junegunn/vim-plug'

" editorconfig
Plug 'editorconfig/editorconfig-vim'

" Auto completion
Plug 'ervandew/supertab'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
" coc sources used:
" coc-solargraph (Ruby, requires solargraph gem)
" coc-elixir (Elixir)
" coc-tsserver (Javascript)
" coc-json (json)
" coc-tabnine (all languages)

" fzf
" requires fzf and ag
Plug 'junegunn/fzf'
Plug 'junegunn/fzf.vim'

" ack.vim
" requires ag
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

" git
Plug 'tpope/vim-fugitive'
Plug 'airblade/vim-gitgutter'
Plug 'christoomey/vim-conflicted'

" Multicursors
Plug 'terryma/vim-multiple-cursors'

" General languages support
Plug 'sheerun/vim-polyglot'
Plug 'Chiel92/vim-autoformat'

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

" Identation
set autoindent
set smartindent
set smarttab
set copyindent
let g:autoformat_autoindent = 0 " Disable autoindent
" This is required to make sure that mix format picks up the project config
" This is specially important for umbrella projects where the config is inside
" the app folder
function! g:MixFormatLocal()
  " Find closesest formatter config file
  let l:formatter_config_file= findfile('.formatter.exs', '.;')
  echo l:formatter_config_file
  if formatter_config_file != ''
    return 'mix format --dot-formatter ' . formatter_config_file . ' -'
  else
    return 'mix format -'
  endif
endfunction
let g:formatdef_mix_format = "g:MixFormatLocal()"

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

" Split
set splitbelow
set splitright

" Maps
map <C-p> :FZF<CR>
map <Leader>r :%s/
map <Leader>f :Ack!<SPACE>
map <Leader>F y:Ack!<SPACE>'<C-R>"'<CR>
map <Leader>/ y/<C-R>"<CR>
map <leader>nt :NERDTree<CR>
map <Leader>e :ALELint \| lopen <CR>
map <Leader>fn :call system('pbcopy', @%)<CR>
map <Leader>gd <Plug>(coc-definition)
let g:SuperTabDefaultCompletionType = "<c-n>"

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

" fzf
let $FZF_DEFAULT_COMMAND = 'ag -g ""'
" hex colors can't be configured using g:fzf_colors, so we configure them here manually
let $FZF_DEFAULT_OPTS = "--color=bg:#1C1C1C,border:#88AFAF"
let g:fzf_colors =
\ { 'fg':      ['fg', 'Normal'],
  \ 'hl':      ['fg', 'Comment'],
  \ 'fg+':     ['fg', 'CursorLine', 'CursorColumn', 'Normal'],
  \ 'bg+':     ['bg', 'CursorLine', 'CursorColumn'],
  \ 'hl+':     ['fg', 'Statement'],
  \ 'info':    ['fg', 'PreProc'],
  \ 'prompt':  ['fg', 'Conditional'],
  \ 'pointer': ['fg', 'Exception'],
  \ 'marker':  ['fg', 'Keyword'],
  \ 'spinner': ['fg', 'Label'],
  \ 'header':  ['fg', 'Comment'] }
let g:fzf_layout = { 'window': { 'width': 0.9, 'height': 0.75 } }

" ack
let g:ackprg = 'ag --vimgrep'
" Set ack.vim quickfix window size
let g:ack_qhandler = "botright copen 15"

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
