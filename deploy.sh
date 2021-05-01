#!/bin/bash

cp -v .xinitrc $HOME
cp -v .profile $HOME
cp -v .gitconfig $HOME

mkdir -pv $HOME/.config/bspwm
mkdir -pv $HOME/.config/sxhkd
mkdir -pv $HOME/.config/polybar
mkdir -pv $HOME/.config/picom
mkdir -pv $HOME/.config/rofi
mkdir -pv $HOME/.config/tilix

cp -vr bspwm $HOME/.config
cp -vr sxhkd $HOME/.config
cp -vr polybar $HOME/.config
cp -vr picom $HOME/.config
cp -vr rofi $HOME/.config
cp -vr tilix $HOME/.config
cp -v X11/xorg.conf.d/* /etc/X11/xorg.conf.d/
