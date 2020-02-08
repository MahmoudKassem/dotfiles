#set the brightness to 50%
brightnessctl --device='amdgpu_bl0' set 128 >> null

#start the desktop enviornment if it isn't already running
if [[ "$(tty)" = "/dev/tty1" ]]; then
    pgrep xfce4 || startx
fi

