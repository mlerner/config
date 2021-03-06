# Check for local zshrc
if [[ -f $HOME/.zshrc.local ]]; then
   source $HOME/.zshrc.local
fi

# Environment variables -----------------------
export EDITOR="vim"
export PAGER="less"
export PATH="${PATH}:${HOME}/bin"
export TERM="rxvt"

# History -------------------------------------
export HISTFILE=~/.zsh_history
export HISTSIZE=1000
export SAVEHIST=1000
export LANG=en_US.UTF-8                      # utf-8 support
setopt hist_ignore_dups                      # don't store duplicate lines in history

# Key bindings --------------------------------
bindkey -e                                   # emacs keybindings

# Prompt --------------------------------------
autoload -U colors && colors
PROMPT="%{${fg_bold[blue]}%}%m %{${fg_bold[grey]}%}:: %{${fg[green]}%}%3~%(0?. . ${fg[red]}%? )%{${fg[grey]}%}»%{${reset_color}%} "

# zsh features --------------------------------
autoload -U compinit
compinit
setopt noclobber              # Don't write over existing files with >, use >! instead
setopt rm_star_wait           # Prompts for confirmation after 'rm *' etc. Helps avoid mistakes like 'rm * o' when 'rm *.o' was intended
setopt autopushd              # Automatically pushd directories
setopt autocd                 # Just typing in name of directory changes to it

# Aliases and functions -----------------------
alias rm='rm -i'
alias mv='mv -i'
alias cp='cp -i'
alias l="ls"
alias ls="ls -F --color=auto"
alias grep="grep --color=auto"
alias sudo="sudo -E"
alias c='gcc -Wall -pedantic -Werror -o exec'
alias vim="vim -p"
alias gvim="gvim -p"

alias vps="ssh coreyf@rwell.org"
alias irc="ssh -t coreyf@rwell.org screen -dr weechat"

alias work="ssh cfadmin@cfslo.selfip.org"

alias vogon="ssh cfarwell@vogon.csc.calpoly.edu"
alias unix1="ssh cfarwell@unix1.csc.calpoly.edu"
alias unix2="ssh cfarwell@unix2.csc.calpoly.edu"
alias unix3="ssh cfarwell@unix3.csc.calpoly.edu"
alias unix4="ssh cfarwell@unix4.csc.calpoly.edu"

function fullscreen {
   RESOLUTION=$(xrandr -q | sed -n '3p' | awk '{ print $1 }')
   xrandr -s $RESOLUTION
}

function py {
   if ((! $#)) && command -v ipython > /dev/null; then
      ipython
   else
      python "$@"
   fi
}

function v {
   if [[ -n $DISPLAY ]] && command -v gvim > /dev/null; then
      gvim "$@"
   elif command -v vim > /dev/null; then
      vim "$@"
   else
      vi "$@"
   fi
}

function onsave {
   while true
   do
      eval "$1 &!" 
      trap "kill $! &> /dev/null; return;" SIGINT SIGTERM
      inotifywait -e modify -qq $2
      kill $! &> /dev/null
   done
}

function terminalcolors {
   echo -e "\\e[0mCOLOR_NC (No color)"
   echo -e "\\e[1;37mCOLOR_WHITE\\t\\e[0;30mCOLOR_BLACK"
   echo -e "\\e[0;34mCOLOR_BLUE\\t\\e[1;34mCOLOR_LIGHT_BLUE"
   echo -e "\\e[0;32mCOLOR_GREEN\\t\\e[1;32mCOLOR_LIGHT_GREEN"
   echo -e "\\e[0;36mCOLOR_CYAN\\t\\e[1;36mCOLOR_LIGHT_CYAN"
   echo -e "\\e[0;31mCOLOR_RED\\t\\e[1;31mCOLOR_LIGHT_RED"
   echo -e "\\e[0;35mCOLOR_PURPLE\\t\\e[1;35mCOLOR_LIGHT_PURPLE"
   echo -e "\\e[0;33mCOLOR_YELLOW\\t\\e[1;33mCOLOR_LIGHT_YELLOW"
   echo -e "\\e[1;30mCOLOR_GRAY\\t\\e[0;37mCOLOR_LIGHT_GRAY"
}
