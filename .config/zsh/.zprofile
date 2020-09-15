if [ "$(tty)" = "/dev/tty1" ]
  then
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

    #prepare and launch sway
    export QT_QPA_PLATFORM=wayland
    export QT_WAYLAND_DISABLE_WINDOWDECORATION="1"
    export GDK_BACKEND=x11
    exec dbus-launch --sh-syntax --exit-with-session sway
fi