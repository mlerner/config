" GENERAL OPTIONS
behave xterm
set viminfo='20,\"500,%	" ' Maximum number of previously edited files for which the marks
			"   are remembered.  
			" " Maximum number of lines saved for each register.
			" % When included, save and restore the buffer list.  If Vim is
			"   started with a file name argument, the buffer list is not
			"   restored.  If Vim is started without a file name argument, the
			"   buffer list is restored from the viminfo file.  Buffers
			"   without a file name and buffers for help files are not written
			"   to the viminfo file.
set history=500		" keep {number} lines of command line history
set nowrap              " whether to wrap lines
set tabstop=3		" ts, number of spaces that a tab is equivalent to
set shiftwidth=3	" sw, number of spaces shifted left and righ when issuing << and >>
set expandtab
			"  commands
" set number		" number lines
set nocompatible
set incsearch
set showmatch
set backspace=1
set nohlsearch

set cinoptions=:0,p0,t0
set cinwords=if,unless,else,while,until,do,for,switch,case
set formatoptions=tcqr
set cindent

if has('gui_running')
   colorscheme solarized
   set background=dark
   set gfn=Inconsolata\ 12
else
   colorscheme solarized
   set background=dark
endif

" Line Numbers
set nu

" VIM DISPLAY OPTIONS
" set showmode		" show which mode (insert, replace, visual)
" set ruler
" set title
" set showcmd		" show commands in status line when typing
" set wildmenu	

" Remembers where you were in the file when last editing
au BufReadPost * if line("'\"") > 0|if line("'\"") <= line("$")|exe("norm '\"")|else|exe "norm $"|endif|endif

" enables filetype detection
filetype on
filetype indent on

"enables filetype specific plugins
filetype plugin on

"allows moving after the end of the line in visual block mode"
set virtualedit+=block

syntax on
