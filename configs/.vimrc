" Lucky's VIM configuration properties
" It must live in your home directory as ~/.vimrc

" ========== Pasting options ============

" Toggles pasting mode. What it essentially does is does not autoindent pasted text when toggled
set pastetoggle=<F2>

" =======================================
" ========== Indention options ==========

" Toggles auto indentation
set autoindent

" =======================================
" ========== Search options =============

" Enable search highlighting
set hlsearch

" Ignores cases when searching
set ignorecase

" Incremental search that shows partial matches
set incsearch

" Automatically switches search to case-sensitive when search query contains an uppercase letter
set smartcase

" =======================================
" ====== Text rendering options =========

" Use encoding that supports unicode
set encoding=utf-8

" Avoid wrapping a line in the middle of a word
set linebreak

" Toggles syntax highlighting
syntax on

" =======================================
" ======= User interface options ========

" Always display the status bar
set laststatus=2

" Show line numbers on the sidebar
set number
