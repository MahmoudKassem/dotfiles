#!/bin/sh

if [ $# -ne 3 ]
  then printf "%s\\n" "Usage: update-git-repos-in-directory <title> <directory containing git projects> <command to execute on update>"
       exit 1
fi

lightBlue=$(tput setaf 12)
normal=$(tput sgr0)
printf "${lightBlue}:: ${normal}Sync %s\\n" "$1"
currentWorkingDirectory="$PWD"
for directory in $(find $2/* -maxdepth 0 -type d)
do
  if cd "$directory" > /dev/null 2>&1
    then
      if git pull | grep -q "Already up to date"
        then printf "%s\\n" " $(printf "%s" "$directory" | sed "s/\/$//; s/\/.*\///") is up to date"
        else $3 && printf "%s\\n" " updated $(printf "%s" "$directory" | sed "s/\/$//; s/\/.*\///")"
      fi
    else printf "%s\\n" " failed to change directory into ($directory)"
  fi
done
if cd "$currentWorkingDirectory" > /dev/null 2>&1
  then true
  else printf "\e[0;33mWARNING\e[0;0m:"
       printf "%s\\n" " failed to change back into working directory ($currentWorkingDirectory),
 this implies that the directory you started this command from has been renamed, moved,
 its permissions have changed or it doesn't exist anymore"
fi
