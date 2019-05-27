#if not running interactively, don't do anything
[[ $- != *i* ]] && return

#set default editor, terminal and browser
export EDITOR="vim"
export TERMINAL="konsole-256color"
export TERM="konsole-256color"
export BROWSER="firefox"

#enable powerline
powerline-daemon -q
POWERLINE_BASH_CONTINUATION=1
POWERLINE_BASH_SELECT=1
. /usr/share/powerline/bindings/bash/powerline.sh

#display system information on startup
neofetch
