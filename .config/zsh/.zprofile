#!/bin/zsh

if [ "$(tty)" = "/dev/tty1" ]
  then exec dbus-launch --sh-syntax --exit-with-session sway
fi
