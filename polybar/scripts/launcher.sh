#!/usr/bin/env bash
mode=$1
rofi -no-config -no-lazy-grab -show $mode -modi $mode -theme ~/.config/polybar/scripts/rofi/launcher.rasi
