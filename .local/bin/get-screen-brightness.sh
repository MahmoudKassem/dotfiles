#!/bin/sh

currentBrightness=$((
  $(head /sys/class/backlight/amdgpu_bl0/brightness)*100 /
  $(head /sys/class/backlight/amdgpu_bl0/max_brightness)))
if [ $currentBrightness -gt 70 ]
  then icon=󰃠
elif [ $currentBrightness -lt 30 ]
  then icon=󰃞
  else icon=󰃟
fi
printf " %s %s%% \\n" $icon $currentBrightness
