#!/bin/sh

source="$HOME/icons"
destination="/usr/share/icons/Papirus"
sizes="16x16 22x22 24x24 32x32 48x48 64x64"
for size in $(printf "%s" "$sizes")
do
  doas cp "$source"/go/"$size"/text-x-go.svg $destination/"$size"/mimetypes/text-x-go.svg
  doas cp "$source"/haskell/"$size"/text-x-haskell.svg $destination/"$size"/mimetypes/text-x-haskell.svg
  doas cp "$source"/prolog/"$size"/text-x-prolog.svg $destination/"$size"/mimetypes/text-x-prolog.svg
done
notify-send "icons successfully updated"
