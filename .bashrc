#set default editor, terminal and browser
export EDITOR="vim"
export TERMINAL="xfce4-terminal"
export BROWSER="brave"

#enable vi keybindings
set -o vi

#enable powerline
powerline-daemon -q
POWERLINE_BASH_CONTINUATION=1
POWERLINE_BASH_SELECT=1
. /usr/share/powerline/bindings/bash/powerline.sh

#display system information on startup
neofetch
