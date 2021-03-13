#!/bin/sh

if [ $# -lt 1 ]
  then user=$USER
  else user=$1
fi

hdmiPcm=$(aplay --list-devices | sed -n -E 's/^card ([0-9]+).*device ([0-9]+).*HDMI.*$/pcm.!default "hw:\1,\2"/p')
alsaConfigPath="/home/$user/.asoundrc"
[ -f "$alsaConfigPath" ] && rm "$alsaConfigPath" && exit
printf "%s" "$hdmiPcm" > "$alsaConfigPath" && chown "$user" "$alsaConfigPath" && chmod 644 "$alsaConfigPath"
