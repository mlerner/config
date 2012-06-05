"---- LOAD PLUGINS ----"

call pathogen#runtime_append_all_bundles()
call pathogen#helptags()


"---- GENERAL ----"

set history=500  "number of lines to keep in history
set number  "display line numbers
set nowrap  "don't wrap lines
set virtualedit+=block  "allows moving after the end of the line in visual block mode"
set backspace=indent,eol,start  "allow backspacing over everything in insert mode
set showmatch  "highlights matching bracket
set nocompatible  "turn off vi compatibility
set clipboard=unnamedplus  "yank to the system register (*) by default
set incsearch  "jump immediately to result as i begin typing


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
   colorscheme darkspectrum
   set cursorline
   highlight CursorLine guibg=#333333 ctermbg=none gui=none cterm=none
else
   colorscheme koehler
endif


"---- SHORTCUTS ----"

"sudo write this
cmap w!! w !sudo tee % >/dev/null


"---- PLUGIN SPECIFIC ----"

let g:ConqueTerm_Color = 1 "only enable colours for the most recent 200 lines


"---- MISC ----"

"remembers where you were in the file when last editing
au BufReadPost * if line("'\"") > 0|if line("'\"") <= line("$")|exe("norm '\"")|else|exe "norm $"|endif|endif
