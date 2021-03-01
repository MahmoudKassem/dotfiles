#!/bin/sh

masterInfo="amixer -M get Master"
pcmInfo="amixer -M get PCM"
currentVolume=$($pcmInfo | grep 'Front Left' | awk '/%/ {gsub("[%\\[\\]]",""); print $5}')
$masterInfo | grep -q off && printf "婢 $currentVolume%% \\n" && exit
if [ "$currentVolume" -gt 70 ]
  then icon=墳
elif [ "$currentVolume" -lt 30 ]
  then icon=奄
  else icon=奔
fi
printf " %s %s%% \\n" $icon "$currentVolume"
