#!/bin/bash

cp -v .gitconfig $HOME
cp -v .gtkrc-2.0 $HOME
cp -v .profile $HOME
cp -v .tmux.conf $HOME
cp -v .xinitrc $HOME
cp -v .zshrc $HOME

mkdir -pv $HOME/.config/bspwm
mkdir -pv $HOME/.config/gtk-3.0
mkdir -pv $HOME/.config/kitty
mkdir -pv $HOME/.config/picom
mkdir -pv $HOME/.config/polybar
mkdir -pv $HOME/.config/rofi
mkdir -pv $HOME/.config/sxhkd
mkdir -pv $HOME/.config/tilix
mkdir -pv $HOME/.config/Pictures

cp -vr bspwm $HOME/.config
cp -vr kitty $HOME/.config
cp -vr gtk-3.0 $HOME/.config
cp -vr picom $HOME/.config
cp -vr polybar $HOME/.config
cp -vr rofi $HOME/.config
cp -vr sxhkd $HOME/.config
cp -vr tilix $HOME/.config

cp -vr local/fonts $HOME/.local/share/
sudo cp -v X11/xorg.conf.d/* /etc/X11/xorg.conf.d/
sudo cp -v lightdm/lightdm.conf /etc/lightdm/
sudo cp -v lightdm/slick-greeter.conf /etc/lightdm/
sudo cp -v wallpapers/city.jpg /usr/share/pixmaps/
sudo cp -v wallpapers/city.jpg $HOME/Pictures/
betterlockscreen -u $HOME/Pictures/city.jpg
