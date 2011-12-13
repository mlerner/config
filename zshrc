#!/usr/bin/env zsh

# Environment variables -----------------------
export EDITOR="vim"
export PAGER="less"
export PATH="${PATH}:${HOME}/bin"
export HISTFILE=~/.zsh_history
export HISTSIZE=1000
export SAVEHIST=1000
export HISTCONTROL=erasedups
#export TERM="rxvt-unicode"

# Key bindings --------------------------------
bindkey -v
bindkey "^[[A" history-search-backward
bindkey "^[[B" history-search-forward

# Aliases -------------------------------------
alias rm='rm -i'
alias mv='mv -i'
alias cp='cp -i'
alias l="ls"
alias ls="ls -F --color=auto"
alias grep="grep --color=auto"
alias ..="cd .."
alias c='gcc -Wall -pedantic -Werror -o exec'
alias rwell="ssh coreyf@rwell.org"
alias work="ssh cfadmin@cfslo.selfip.org"

#------------------------------
# Comp stuff
#------------------------------
autoload -U compinit
compinit
setopt NOCLOBBER # Don.t write over existing files with >, use >! instead
setopt RM_STAR_WAIT # Prompts for confirmation after 'rm *' etc. Helps avoid mistakes like 'rm * o' when 'rm *.o' was intended

#------------------------------
# Prompt
#------------------------------
PROMPT="%m %{${fg_bold[red]}%}:: %{${fg[green]}%}%3~%(0?. . ${fg[red]}%? )%{${fg[blue]}%}»%{${reset_color}%} "

#------------------------------
# Unorganized
#------------------------------
setopt autopushd

# turn on utf-8 support
export LANG=en_US.UTF-8

irc() {
  printf \\033]0\;\%s\\007 "irc"
  ssh -t corey@109.169.57.37 screen -dr irssi
}


fullscreen() {
   RESOLUTION=$(xrandr -q | sed -n '3p' | awk '{ print $1 }')
   xrandr -s $RESOLUTION
}

py() {
   if ((! $#)) && command -v ipython > /dev/null; then
      ipython
   else
      python "$@"
   fi
}

v() {
   if [[ -n $DISPLAY ]] && command -v gvim > /dev/null; then
      gvim "$@"
   elif command -v vim > /dev/null; then
      vim "$@"
   else
      vi "$@"
   fi
}
