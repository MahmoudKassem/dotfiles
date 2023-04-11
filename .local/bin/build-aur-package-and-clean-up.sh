#!/bin/sh

makepkg -sirc --noconfirm --noarchive
git clean -fd
