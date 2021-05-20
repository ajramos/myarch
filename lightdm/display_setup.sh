#!/bin/sh
xrandr --setprovideroutputsource modesetting NVIDIA-0

PRIMARY_MONITOR=eDP-1-1
SECONDARY_MONITOR=HDMI-1-1

HAS_SECONDARY=$(xrandr | grep $SECONDARY_MONITOR | cut -f 2 -d ' ')

if [ "$HAS_SECONDARY" != "connected" ]; then
  echo "$(date +%FT%H:%M:%S) Single Monitor Config" >> /tmp/lightdm_init.log
  xrandr --auto
else
  echo "$(date +%FT%H:%M:%S) Dual Monitor Config" >> /tmp/lightdm_init.log
  xrandr --output $PRIMARY_MONITOR --auto --primary \
	 --output $SECONDARY_MONITOR --mode 3840x2160 --right-of $PRIMARY_MONITOR
fi
