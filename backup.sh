#!/bin/bash

cp -v $HOME/.gitconfig .
cp -v $HOME/.gtkrc-2.0 .
cp -v $HOME/.profile .
cp -v $HOME/.tmux.conf .
cp -v $HOME/.xinitrc .
cp -v $HOME/.zshrc .

cp -vr $HOME/.config/bspwm .
cp -vr $HOME/.config/dunst .
cp -vr $HOME/.config/kitty .
cp -vr $HOME/.config/nvim .
cp -vr $HOME/.config/sxhkd .
cp -vr $HOME/.config/picom .
cp -vr $HOME/.config/polybar .
cp -vr $HOME/.config/rofi .
cp -vr $HOME/.config/sxhkd .
cp -vr $HOME/.config/tilix .
cp -vr $HOME/.config/gtk-3.0 .
cp -vr $HOME/.config/pcmanfm .

cp -v /etc/X11/xorg.conf.d/40-libinput.conf ./X11/xorg.conf.d/
cp -v /etc/lightdm/{lightdm.conf,slick-greeter.conf} ./lightdm/
cp -vr $HOME/.local/share/fonts local/share/
cp -v /etc/nsswitch.conf printer/nss-mdns/
sudo cp -v /etc/cups/cups-files.conf cups/

yay -Q > package_list.txt
