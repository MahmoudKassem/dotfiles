#!/bin/sh

networkStatus=$(nmcli d | awk '!/--/ && NR==2 {print $2; for (i=4; i<=NF; i++) print $i}' | xargs)
connectionType=$(printf "%s" "$networkStatus" | awk '{print $1}')
connectionName=$(printf "%s" "$networkStatus" | awk '{print $2}')
if [ "$connectionType" = "wifi" ]
  then icon=
elif [ "$connectionType" = "ethernet" ]
  then icon=
fi
printf "%s  %s \\n" $icon "$connectionName"
