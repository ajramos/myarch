xrandr -s 1280x800 &
systemctl --user import-environment DISPLAY
exec bspwm
