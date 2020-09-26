#!/bin/zsh

#default applications
export BROWSER="firefox"
export EDITOR="nvim"
export FILE="pcmanfm"
export READER="zathura"
export SHELL="zsh"
export TERMINAL="alacritty"

#follow XDG Base Dir Spec
export XDG_CONFIG_HOME=$HOME/.config
export XDG_DATA_HOME=$HOME/.local/share
export XDG_CACHE_HOME=$HOME/.cache
export GNUPGHOME=$XDG_DATA_HOME/gnupg
export GOPATH=$XDG_DATA_HOME/go
export STACK_ROOT=$XDG_DATA_HOME/stack
export ZDOTDIR=$XDG_CONFIG_HOME/zsh

#set colors for less and disable its history file
export LESSHISTFILE="-"
export LESS_TERMCAP_mb=$(printf "\e[1;36m")
export LESS_TERMCAP_md=$(printf "\e[1;36m")
export LESS_TERMCAP_me=$(printf "\e[0m")
export LESS_TERMCAP_se=$(printf "\e[0m")
export LESS_TERMCAP_so=$(printf "\e[1;30;32m")
export LESS_TERMCAP_ue=$(printf "\e[0m")
export LESS_TERMCAP_us=$(printf "\e[1;32m")

#setting for fzf
export FZF_ALT_C_COMMAND="rg --hidden --files --null 2> /dev/null | xargs -0 dirname | uniq"
export FZF_CTRL_T_COMMAND='rg --files --ignore-case --hidden -g "!{.git}/*"'
export FZF_DEFAULT_OPS='--extended'
export FZF_DEFAULT_COMMAND=$FZF_CTRL_T_COMMAND

#use xwayland to render GTK 3 apps properly
export GDK_BACKEND=x11
