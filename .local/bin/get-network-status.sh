#!/bin/sh

networkStatus=$(nmcli d | sed -n -E 's/^\w+\s+(\w+)\s+connected\s+(.*)$/\1 \2/p' | head -n 1)
connectionType=$(printf "%s" "$networkStatus" | cut -d ' ' -f1)
connectionName=$(printf "%s" "$networkStatus" | cut -d ' ' -f2)
if [ "$connectionType" = "wifi" ]
  then icon=
elif [ "$connectionType" = "ethernet" ]
  then icon=
fi
printf " %s  %s \\n" $icon "$connectionName"
