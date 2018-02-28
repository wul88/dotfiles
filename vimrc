set nocompatible          " get rid of Vi compatibility mode. SET FIRST!
filetype plugin indent on " filetype detection[ON] plugin[ON] indent[ON]
set t_Co=256              " enable 256-color mode.
syntax on                 " enable syntax highlighting.
colorscheme desert        " set colorscheme
set number                " show line numbers
set laststatus=2          " last window always has a statusline
filetype indent on        " activates indenting for files
set nohlsearch            " Don't continue to highlight searched phrases.
set incsearch             " But do highlight as you type your search.
set ignorecase            " Make searches case-insensitive.
set ruler                 " Always show info along bottom.
set autoindent            " auto-indent
set tabstop=4             " tab spacing
set softtabstop=4         " unify
set shiftwidth=4          " indent/outdent by 4 columns
set shiftround            " always indent/outdent to the nearest tabstop
set expandtab             " use spaces instead of tabs
set smarttab              " use tabs at the start of a line, spaces elsewhere
set nowrap                " don't wrap text

highlight Comment cterm=bold ctermbg=DarkGray ctermfg=LightBlue
highlight Normal cterm=none
syntax region Commnd matchgroup=Commnd start=+{ + end=+&+
highlight link Commnd SpecialComment
"let skip_defaults_vim=1     " disable viminfo file
"set viminfo=""

if has('persistent_undo')
    set undodir=~/.vim/undodir
    set undofile
    set undolevels=120
    set undoreload=60
endif

" Allow backspacing over autoindent, line breaks and start of insert action
set backspace=indent,eol,start
 
" When opening a new line and no filetype-specific indenting is enabled, keep
" the same indent as the line you're currently on. Useful for READMEs, etc.
"set autoindent

" Whitespace
set wrap
set textwidth=79
set formatoptions=tcqrn1
"set noshiftround

"trigger autoread when changing buffers inside while inside vim
au FocusGained, BufEnter * : checktime
"during insert, kj escapes, `^ is so that the cursor doesn't move
inoremap kj <Esc>`^
"during insert, lkj escapes and saves
inoremap lkj <Esc>`^:w<CR>
"during insert,capes and saves and QUITS
inoremap ;lkj <Esc>:wq<CR>  
"if &wrap set, go+=b\r;, if not go=-b\r
:nnoremap <silent><expr> <f2> ':set wrap! go'.'-+'[&wrap]."=b\r"

