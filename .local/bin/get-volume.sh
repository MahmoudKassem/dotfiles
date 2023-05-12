#!/bin/sh

masterInfo="amixer -M get Master"
pcmInfo="amixer -M get PCM"
currentVolume=$($pcmInfo | sed -n -E 's/^.*Front Left:.*\[([0-9]+)%\].*$/\1/p')
$masterInfo | grep -q off && printf "󰸈 $currentVolume%% \\n" && exit
if [ "$currentVolume" -gt 70 ]
  then icon=󰕾
elif [ "$currentVolume" -lt 30 ]
  then icon=󰕿
  else icon=󰖀
fi
printf " %s %s%% \\n" $icon "$currentVolume"
