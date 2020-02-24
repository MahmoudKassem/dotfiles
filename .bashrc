#set default editor, terminal and browser
export EDITOR="nvim"
export TERMINAL="alacritty"
export BROWSER="brave"

#enable vi modes and make them visible in trueline
set -o vi
export TRUELINE_SHOW_VIMODE=true

#load trueline
source ~/trueline/trueline.sh

#show systeminfo
neofetch
