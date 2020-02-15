#set default editor, terminal and browser
export EDITOR="vim"
export TERMINAL="alacritty"
export BROWSER="brave"

#enable vi keybindings
set -o vi

#enable pureline
if [[ -r "/usr/share/pureline/pureline" ]]; then
    source /usr/share/pureline/pureline ~/.pureline.conf
fi
