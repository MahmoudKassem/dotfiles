#start the desktop enviornment if it isn't already running
if [[ "$(tty)" = "/dev/tty1" ]]; then
    pgrep xfce4 || startx
fi

