#!/bin/sh

currentBrightness=$(cat /sys/class/backlight/amdgpu_bl0/brightness)
newBrightness=$(( currentBrightness + $1 ))
if [ "$newBrightness" -ge 0 ] && [ "$newBrightness" -lt 255 ]
  then printf "%s" $newBrightness | doas -- tee -a /sys/class/backlight/amdgpu_bl0/brightness > /dev/null
  else notify-send "brightness values range from 0 to 255 current value is $currentBrightness"
fi
