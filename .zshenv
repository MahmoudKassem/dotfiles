#!/bin/zsh

#default applications
export BROWSER="brave"
export EDITOR="nvim"
export FILE="pcmanfm"
export IMAGE="imv"
export READER="zathura"
export SHELL="zsh"
export TERMINAL="qterminal"
export VIDEO="mpv"

#follow XDG Base Dir Spec
export XDG_CACHE_HOME=$HOME/.cache
export XDG_CONFIG_HOME=$HOME/.config
export XDG_DATA_HOME=$HOME/.local/share
export CARGO_HOME=$XDG_DATA_HOME/cargo
export GNUPGHOME=$XDG_DATA_HOME/gnupg
export GOPATH=$XDG_DATA_HOME/go
export GTK2_RC_FILES=$XDG_CONFIG_HOME/gtk-2.0/gtkrc
export STACK_ROOT=$XDG_DATA_HOME/stack
export PASSWORD_STORE_DIR=$XDG_DATA_HOME/pass
export ZDOTDIR=$XDG_CONFIG_HOME/zsh

#set colors for less and disable its history file
cyan=$(tput setaf 6)
green=$(tput setaf 2)
yellow=$(tput setaf 3)
normal=$(tput sgr0)
export LESSHISTFILE="-"
export LESS_TERMCAP_md=$(printf "${cyan}")
export LESS_TERMCAP_me=$(printf "${normal}")
export LESS_TERMCAP_so=$(printf "${yellow}")
export LESS_TERMCAP_se=$(printf "${normal}")
export LESS_TERMCAP_us=$(printf "${green}")
export LESS_TERMCAP_ue=$(printf "${normal}")
