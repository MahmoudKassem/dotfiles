#!/bin/zsh

#set default applications
export EDITOR="nvim"
export TERMINAL="alacritty"
export SHELL="zsh"
export BROWSER="firefox"
export FILE="pcmanfm"
export READER="zathura"

#follow XDG Base Dir Spec
export XDG_CONFIG_HOME="$HOME/.config"
export XDG_DATA_HOME="$HOME/.local/share"
export XDG_CACHE_HOME="$HOME/.cache"
export GOPATH="${XDG_DATA_HOME:-$HOME/.local/share}/go"
export ZDOTDIR="${XDG_CONFIG_HOME:-$HOME/.config}/zsh"

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
export FZF_DEFAULT_COMMAND="$FZF_CTRL_T_COMMAND"

#QT and GTK settings for wayland
export QT_QPA_PLATFORM=wayland
export QT_WAYLAND_DISABLE_WINDOWDECORATION="1"
export GDK_BACKEND=x11
