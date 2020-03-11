#set default editor, terminal and browser
export EDITOR="nvim"
export TERMINAL="alacritty"
export BROWSER="brave"

#set colors for less which is used in man to have colored man pages
export LESS_TERMCAP_mb=$'\E[1;31m'     # begin blink
export LESS_TERMCAP_md=$'\E[1;36m'     # begin bold
export LESS_TERMCAP_me=$'\E[0m'        # reset bold/blink
export LESS_TERMCAP_so=$'\E[01;30;32m' # begin reverse video
export LESS_TERMCAP_se=$'\E[0m'        # reset reverse video
export LESS_TERMCAP_us=$'\E[1;32m'     # begin underline
export LESS_TERMCAP_ue=$'\E[0m'        # reset underline

#enable vi modes
set -o vi

#load starship prompt
eval "$(starship init bash)"

#show systeminfo
neofetch
