#!/bin/sh

pacman -Qen | awk '{print $1;}' > ~/dotfiles/native-packages
pacman -Qem | awk '{print $1;}' > ~/dotfiles/foreign-packages
