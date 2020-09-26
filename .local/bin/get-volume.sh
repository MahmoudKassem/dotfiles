#!/bin/sh

soundInfo="amixer -M get Master"
currentVolume=$($soundInfo | awk '/%/ {gsub("[%\\[\\]]",""); print $4}')
$soundInfo | grep -q off && printf "婢 $currentVolume%% \\n" && exit
if [ "$currentVolume" -gt 70 ]
  then icon=墳
elif [ "$currentVolume" -lt 30 ]
  then icon=奄
  else icon=奔
fi
printf "%s %s%% \\n" $icon "$currentVolume"
