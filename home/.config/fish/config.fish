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

alias vps "ssh coreyf@rwell.org"
alias irc "ssh -t coreyf@rwell.org screen -dr weechat"

alias work "ssh cfadmin@cfslo.selfip.org"

alias vogon "ssh cfarwell@vogon.csc.calpoly.edu"
alias unix1 "ssh cfarwell@unix1.csc.calpoly.edu"
alias unix2 "ssh cfarwell@unix2.csc.calpoly.edu"
alias unix3 "ssh cfarwell@unix3.csc.calpoly.edu"
alias unix4 "ssh cfarwell@unix4.csc.calpoly.edu"

set -x PATH /home/coreyf/bin $PATH

function resetwireless
   sudo rmmod rtl8192se
   echo "Unloading module rtl8192se"
   sleep 4
   echo "Adding module rtl8192se"
   sudo modprobe rtl8192se
end

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
   python -m SimpleHTTPServer
end
