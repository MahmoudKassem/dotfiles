#!/bin/sh

makepkg -sirc --noconfirm --noarchive
git reset --hard HEAD >> /dev/null
git clean -fd
