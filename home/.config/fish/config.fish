if test -e ~/.config/fish/local.fish
   source ~/.config/fish/local.fish
end

set fish_greeting ""

alias rm 'command rm -i'
alias mv 'command mv -i'
alias cp 'command cp -i'
alias l "ls"
alias grep "command grep --color=auto"
alias sudo "command sudo -E"
alias c 'gcc -Wall -pedantic -Werror -o exec'
alias vim "command vim -p"
alias gvim "command gvim -p"

set -x PATH ~/bin $PATH

function terminalcolors
   echo -e "\\e[0mCOLOR_NC (No color)"
   echo -e "\\e[1;37mCOLOR_WHITE\\t\\e[0;30mCOLOR_BLACK"
   echo -e "\\e[0;34mCOLOR_BLUE\\t\\e[1;34mCOLOR_LIGHT_BLUE"
   echo -e "\\e[0;32mCOLOR_GREEN\\t\\e[1;32mCOLOR_LIGHT_GREEN"
   echo -e "\\e[0;36mCOLOR_CYAN\\t\\e[1;36mCOLOR_LIGHT_CYAN"
   echo -e "\\e[0;31mCOLOR_RED\\t\\e[1;31mCOLOR_LIGHT_RED"
   echo -e "\\e[0;35mCOLOR_PURPLE\\t\\e[1;35mCOLOR_LIGHT_PURPLE"
   echo -e "\\e[0;33mCOLOR_YELLOW\\t\\e[1;33mCOLOR_LIGHT_YELLOW"
   echo -e "\\e[1;30mCOLOR_GRAY\\t\\e[0;37mCOLOR_LIGHT_GRAY"
end

function xinvertcolors
   xcalib -invert -alter
end

function serve
   python -m SimpleHTTPServer $argv
end

# fish prompt

set -g __fish_git_prompt_show_informative_status 1
set -g __fish_git_prompt_hide_untrackedfiles 1

set -g __fish_git_prompt_color_branch magenta --bold
set -g __fish_git_prompt_showupstream "informative"
set -g __fish_git_prompt_char_upstream_ahead "↑"
set -g __fish_git_prompt_char_upstream_behind "↓"
set -g __fish_git_prompt_char_upstream_prefix ""

set -g __fish_git_prompt_char_stagedstate "●"
set -g __fish_git_prompt_char_dirtystate "✚"
set -g __fish_git_prompt_char_untrackedfiles "…"
set -g __fish_git_prompt_char_conflictedstate "✖"
set -g __fish_git_prompt_char_cleanstate "✔"

set -g __fish_git_prompt_color_dirtystate blue
set -g __fish_git_prompt_color_stagedstate yellow
set -g __fish_git_prompt_color_invalidstate red
set -g __fish_git_prompt_color_untrackedfiles $fish_color_normal
set -g __fish_git_prompt_color_cleanstate green --bold

function fish_prompt --description 'Write out the prompt'
   set -l last_status $status

   if not set -q __fish_prompt_normal
       set -g __fish_prompt_normal (set_color normal)
   end

   # PWD
   set_color $fish_color_cwd
   echo -n (prompt_pwd)
   set_color normal

   printf '%s ' (__fish_git_prompt)

   if not test $last_status -eq 0
      set_color $fish_color_error
   end

   echo -n '$ '
end
