#!/bin/sh

systemInfo=$(top -b -i -n 1)
cpuUsage=$(printf "%s" "$systemInfo" | awk '/Cpu/ {print $2;}')
ramUsage=$(printf "%s" "$systemInfo" | awk '/MiB Mem/ {printf "%.1f", ($8 / $6 * 100);}')

printf "   %s%%  %s%% \\n" "$cpuUsage" "$ramUsage"
