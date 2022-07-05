#!/bin/zsh

#add user specific programs to path
export PATH="$PATH:$HOME/.local/bin"

# history settings
HISTFILE=~/.cache/command-history
HISTSIZE=16384
SAVEHIST=16384

#enable opening folders directly
setopt autocd nomatch

#enable vi modes
bindkey -v

#allow editing command in temporary vim buffer
autoload edit-command-line; zle -N edit-command-line
bindkey '^e' edit-command-line

#enable menu auto complete suggestion including hidden files
autoload -U compinit
zstyle ':completion:*' menu select
zmodload zsh/complist
_comp_options+=(globdots)
compinit

#set bindings for vim movement keys during menu selection
bindkey -M menuselect 'h' vi-backward-char
bindkey -M menuselect 'k' vi-up-line-or-history
bindkey -M menuselect 'l' vi-forward-char
bindkey -M menuselect 'j' vi-down-line-or-history

#aliases
alias a='update-git-repos-in-directory.sh "AUR packages" $HOME/aur "makepkg -sirc"'
alias d='cd "$(find . -type d | fzy)"'
alias f='open-file.sh "$(rg --files --hidden | fzy)"'
alias g='git'
alias h='eval "$(tac ~/.cache/command-history | fzy)"'
alias m='nohup qterminal -e mpv --shuffle --loop-playlist=inf $HOME/music > /dev/null &'
alias n='update-git-repos-in-directory.sh "NeoVim plugins" $HOME/.local/share/nvim/site/pack/plugins/opt "git diff --stat @{1}"'
alias l="ls -hA --color=auto"
alias t="tree -aC"
alias u='doas -- pacman -Syu && a && n'
alias v="nvim"

#load starship prompt
eval "$(starship init zsh)"

#load zsh plugins
source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
source /usr/share/zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh

#show systeminfo
neofetch
