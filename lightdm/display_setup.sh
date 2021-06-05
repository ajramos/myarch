#!/bin/sh
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
