#!/bin/sh
export XAUTHORITY=/home/ajramos/.Xauthority
export DISPLAY=:0
export DBUS_SESSION_BUS_ADDRESS=unix:path=/run/user/1000/bus

xrandr --setprovideroutputsource modesetting NVIDIA-0

PRIMARY_MONITOR=$(xrandr | grep " connected " | grep eDP |cut -f 1 -d ' ')
SECONDARY_MONITOR=$(xrandr | grep " connected " | grep HDMI |cut -f 1 -d ' ')

HAS_SECONDARY=$(xrandr | grep $SECONDARY_MONITOR | cut -f 2 -d ' ')

if [ "$HAS_SECONDARY" != "connected" ]; then
  echo "$(date +%FT%H:%M:%S) Single Monitor Config" >> /tmp/lightdm_init.log
  xrandr --auto
else
  echo "$(date +%FT%H:%M:%S) Dual Monitor Config" >> /tmp/lightdm_init.log
  xrandr --output $PRIMARY_MONITOR --auto --primary \
	 --output $SECONDARY_MONITOR --mode 3840x2160 --left-of $PRIMARY_MONITOR
fi
bspc wm -r
bspc config -m $SECONDARY_MONITOR bottom_padding 28
bspc config -m $SECONDARY_MONITOR right_padding 0
