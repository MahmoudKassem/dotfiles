#!/bin/sh

currentBrightness=$(head /sys/class/backlight/amdgpu_bl1/brightness)
maxBrigthness=$(head /sys/class/backlight/amdgpu_bl1/max_brightness)
newBrightness=$(( currentBrightness + $1 ))
if [ "$newBrightness" -ge 0 ] && [ "$newBrightness" -le "$maxBrigthness" ]
  then printf "%s" $newBrightness | doas -- tee -a /sys/class/backlight/amdgpu_bl1/brightness > /dev/null
  else notify-send "brightness values range from 0 to $maxBrigthness current value is $currentBrightness"
fi
