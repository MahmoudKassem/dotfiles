#set default editor, terminal and browser
export EDITOR="nvim"
export TERMINAL="alacritty"
export BROWSER="brave"
export PATH="$PATH:$HOME/scripts"

#set colors for less which is used in man to have colored man pages
export LESS_TERMCAP_md=$'\E[1;36m'
export LESS_TERMCAP_me=$'\E[0m'
export LESS_TERMCAP_so=$'\E[01;30;32m'
export LESS_TERMCAP_se=$'\E[0m'
export LESS_TERMCAP_us=$'\E[1;32m'
export LESS_TERMCAP_ue=$'\E[0m'

#alias for system update including AUR packages
alias syu="doas -- pacman -Syu && update-aur-packages.sh"

#enable vi modes
set -o vi

#load starship prompt
eval "$(starship init bash)"

#show systeminfo
neofetch
