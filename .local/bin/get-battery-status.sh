#!/bin/sh

currentBatteryCapacity=$(head /sys/class/power_supply/BATT/capacity)
currentBatteryStatus=$(head /sys/class/power_supply/BATT/status)
[ "$currentBatteryStatus" = "Charging" ] && printf " $currentBatteryCapacity%% \\n" && exit
if [ "$currentBatteryCapacity" -ge 99 ]
  then icon= && notify-send "battery fully charged"
elif [ "$currentBatteryCapacity" -gt 70 ]
  then icon=
elif [ "$currentBatteryCapacity" -gt 50 ]
  then icon=
elif [ "$currentBatteryCapacity" -gt 30 ]
  then icon=
elif [ "$currentBatteryCapacity" -lt 10 ]
  then icon= && notify-send "battery low"
  else icon=
fi
printf " %s %s%% \\n" $icon "$currentBatteryCapacity"
