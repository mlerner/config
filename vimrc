"---- PLUGINS ----"

call pathogen#runtime_append_all_bundles()
call pathogen#helptags()


"---- GENERAL ----"

set history=500  "number of lines to keep in history
set number  "display line numbers
set nowrap  "don't wrap lines
set virtualedit+=block  "allows moving after the end of the line in visual block mode"
set backspace=2  "make backspace work like most other apps  
set showmatch  "highlights matching bracket


"---- SEARCH ----"

set incsearch
set nohlsearch  "don't highlight results for a search

"---- TABS/SPACES ----"

set expandtab  "pressing 'tab' results in spaces
set tabstop=3  "number of spaces that a tab is equivalent to
set shiftwidth=3  "number of spaces shifted left and righ when issuing << and >>


"---- FILETYPES ----"

filetype on  "enables filetype detection
filetype plugin on  "enable loading the plugin files for specific file types
filetype indent on  "enable loading the indent file for specific file types


"---- VISUALS ----"

syntax on  "syntax highlighting
if has('gui_running')
   set guioptions=agi  "minimal gvim interface
   set gfn=Inconsolata\ 11
   colorscheme vividchalk
else
   colorscheme koehler
endif


"---- MISC ----"

"remembers where you were in the file when last editing
au BufReadPost * if line("'\"") > 0|if line("'\"") <= line("$")|exe("norm '\"")|else|exe "norm $"|endif|endif


" UNDER REVIEW "
"set viminfo='20,\"500,%	" ' Maximum number of previously edited files for which the marks
"
"set cinoptions=:0,p0,t0
"set cinwords=if,unless,else,while,until,do,for,switch,case
"set formatoptions=tcqr
"set cindent
