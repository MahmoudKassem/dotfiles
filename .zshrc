#set default editor, terminal and browser
export EDITOR="nvim"
export TERMINAL="alacritty"
export SHELL="zsh"
export BROWSER="brave"
export FILE="pcmanfm"
export PATH="$PATH:$HOME/scripts"

#set colors for less which is used in man to have colored man pages
export LESS_TERMCAP_mb=$(printf "\e[1;36m")
export LESS_TERMCAP_md=$(printf "\e[1;36m")
export LESS_TERMCAP_me=$(printf "\e[0m")
export LESS_TERMCAP_se=$(printf "\e[0m")
export LESS_TERMCAP_so=$(printf "\e[1;30;32m")
export LESS_TERMCAP_ue=$(printf "\e[0m")
export LESS_TERMCAP_us=$(printf "\e[1;32m")

# history settings
HISTFILE=~/.cache/histfile
HISTSIZE=16384
SAVEHIST=16384

#enable opening folders directly
setopt autocd nomatch

#enable vi modes
bindkey -v

#enable menu auto complete suggestion including hidden files
autoload -U compinit
zstyle ':completion:*' menu select
zmodload zsh/complist
_comp_options+=(globdots)
compinit

#aliases
alias syu="doas -- pacman -Syu && update-aur-packages.sh"
alias ls="ls -A --color=auto"

#load plugins
source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
source /usr/share/zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh

#load starship prompt
eval "$(starship init zsh)"

#load direnv
eval "$(direnv hook zsh)"

#show systeminfo
neofetch
