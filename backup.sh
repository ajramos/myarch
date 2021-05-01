#!/bin/bash

cp -v $HOME/.xinitrc .
cp -v $HOME/.profile .
cp -vr $HOME/.config/bspwm .
cp -vr $HOME/.config/sxhkd .
cp -vr $HOME/.config/polybar .
cp -vr $HOME/.config/picom .
cp -vr $HOME/.config/rofi .
cp -vr $HOME/.config/tilix .
cp -v /etc/X11/xorg.conf.d/40-libinput.conf ./X11/xorg.conf.d/
