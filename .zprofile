if [ "$(tty)" = "/dev/tty1" ]; then
    export QT_QPA_PLATFORM=wayland
    export QT_WAYLAND_DISABLE_WINDOWDECORATION="1"
    export GDK_BACKEND=x11
    exec dbus-launch --sh-syntax --exit-with-session sway
fi
