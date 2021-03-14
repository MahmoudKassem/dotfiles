#!/bin/sh

masterInfo="amixer -M get Master"
pcmInfo="amixer -M get PCM"
currentVolume=$($pcmInfo | sed -n -E 's/^.*Front Left:.*\[([0-9]+)%\].*$/\1/p')
$masterInfo | grep -q off && printf "婢 $currentVolume%% \\n" && exit
if [ "$currentVolume" -gt 70 ]
  then icon=墳
elif [ "$currentVolume" -lt 30 ]
  then icon=奄
  else icon=奔
fi
printf " %s %s%% \\n" $icon "$currentVolume"
