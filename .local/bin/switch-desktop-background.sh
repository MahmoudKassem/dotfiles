#!/bin/sh

while true
do
  killall swaybg
  swaybg -i "$(find "$HOME"/pics -name '*.jpg' | shuf -n 1)" -m fill \
         -o "$(swaymsg --pretty -t get_outputs | cut -d ' ' -f2)" > /dev/null 2>&1 &
  sleep "$1"
done
