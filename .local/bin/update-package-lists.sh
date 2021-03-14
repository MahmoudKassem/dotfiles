#!/bin/sh

pacman -Qen | cut -d ' ' -f1 > ~/dotfiles/native-packages
pacman -Qem | cut -d ' ' -f1 > ~/dotfiles/foreign-packages
