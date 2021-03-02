#!/bin/sh

systemInfo=$(top -b -i -n 1)
cpuUsage=$(printf "%s" "$systemInfo" | awk '/Cpu/ {printf "%.0f", $2;}')
ramUsage=$(printf "%s" "$systemInfo" | awk '/MiB Mem/ {printf "%.0f", ($8 / $4 * 100);}')

printf "   %s%%   %s%% \\n" "$cpuUsage" "$ramUsage"
