#!/bin/sh

currentBatteryCapacity=$(head /sys/class/power_supply/BATT/capacity)
currentBatteryStatus=$(head /sys/class/power_supply/BATT/status)
[ "$currentBatteryStatus" = "Charging" ] && printf " 󰂄 $currentBatteryCapacity%% \\n" && exit
if [ "$currentBatteryCapacity" -ge 99 ]
  then icon=󱊣 && notify-send "battery fully charged"
elif [ "$currentBatteryCapacity" -ge 47 ]
  then icon=󱊢
elif [ "$currentBatteryCapacity" -lt 11 ]
  then icon=󰂃 && notify-send "battery low"
  else icon=󱊡
fi
printf " %s %s%% \\n" $icon "$currentBatteryCapacity"
