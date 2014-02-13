set shell=/bin/sh


"---- LOAD PLUGINS ----"

set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

Bundle 'gmarik/vundle'

Bundle 'airblade/vim-gitgutter'
Bundle 'Lokaltog/vim-easymotion'
Bundle 'scrooloose/nerdtree'
Bundle 'skammer/vim-css-color'
Bundle 'tpope/vim-fugitive'
Bundle 'flazz/vim-colorschemes'
Bundle 'majutsushi/tagbar'
Bundle 'scrooloose/syntastic'
Bundle 'bling/vim-airline'
Bundle 'kien/ctrlp.vim'

" Python
Bundle 'vim-scripts/pythoncomplete'

" JavaScript
Bundle 'wookiehangover/jshint.vim'

" Fish
Bundle 'dag/vim-fish'

" CoffeeScript
Bundle 'kchmck/vim-coffee-script'

" Rust
Bundle 'wting/rust.vim'

" TOML
Bundle 'cespare/vim-toml'

" Turn git gutter realtime off until bug gets fixed
let g:gitgutter_realtime = 0

"---- GENERAL ----"

set history=500  "number of lines to keep in history
set number  "display line numbers
set nowrap  "don't wrap lines
set virtualedit+=block  "allows moving after the end of the line in visual block mode
set backspace=indent,eol,start  "allow backspacing over everything in insert mode
set showmatch  "highlights matching bracket
set nocompatible  "turn off vi compatibility
set clipboard=unnamedplus  "yank to the system register (*) by default
set incsearch  "jump immediately to result as i begin typing
set laststatus=2
set autoindent
set wildmode=list  "show list instead of automatically autocompleting


"---- TABS/SPACES ----"

set expandtab  "pressing 'tab' results in spaces
set tabstop=3  "number of spaces that a tab is equivalent to
set shiftwidth=3  "number of spaces shifted left and righ when issuing << and >>


"---- FILETYPES ----"

filetype on  "enables filetype detection
filetype plugin on  "enable loading the plugin files for specific file types
filetype indent on  "enable loading the indent file for specific file types


"---- VISUALS ----"

let g:airline_left_sep=''
let g:airline_right_sep=''

syntax on  "syntax highlighting
if has('gui_running')
   set guioptions=agi  "minimal gvim interface
   set gfn=Inconsolata:h16
   colorscheme ir_black
   set cursorline

   " change color of column width indicator
   hi ColorColumn guibg=#111111

   "change color of gitgutter column
   hi SignColumn guibg=#000000
else
   colorscheme koehler
endif


"---- SHORTCUTS ----"

"sudo write this
cmap w!! w !sudo tee % >/dev/null


"---- PLUGIN SPECIFIC ----"

map <leader>n :NERDTreeToggle<CR>
let NERDTreeIgnore = ['\.pyc$'] "hide certain filetypes


"---- MISC ----"

"remembers where you were in the file when last editing
au BufReadPost * if line("'\"") > 0|if line("'\"") <= line("$")|exe("norm '\"")|else|exe "norm $"|endif|endif
