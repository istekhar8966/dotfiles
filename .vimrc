
" Define polyglot disabled languages BEFORE plugin loading
let g:polyglot_disabled = ['autoindent']

call plug#begin('~/.vim/plugged')

" Colorscheme
Plug 'morhetz/gruvbox'

" UI
Plug 'itchyny/lightline.vim'
Plug 'mengelbrecht/lightline-bufferline'

" Language support
Plug 'rust-lang/rust.vim'
Plug 'sheerun/vim-polyglot'
" LSP & Completion
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'honza/vim-snippets'

" Editing enhancements
Plug 'tpope/vim-surround'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-repeat'

" Git
Plug 'tpope/vim-fugitive'
Plug 'airblade/vim-gitgutter'

call plug#end()

" Highlight yanked text
au TextYankPost * silent! lua vim.highlight.on_yank {timeout=200}

"==============================================================================
" Basic Settings
"==============================================================================
set clipboard=unnamedplus
set mouse=a
syntax enable
filetype plugin indent on

" Performance optimizations
set lazyredraw
set ttyfast
set updatetime=300
set timeoutlen=500

" UI
set number relativenumber
set cursorline
