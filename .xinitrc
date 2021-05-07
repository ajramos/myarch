xrandr -s 1280x800 &
systemctl --user import-environment DISPLAY
pcmanfm -d &
exec bspwm
