#! /bin/sh

PRIMARY_MONITOR=$(xrandr | grep " connected " | grep eDP |cut -f 1 -d ' ') 
SECONDARY_MONITOR=$(xrandr | grep " connected " | grep HDMI |cut -f 1 -d ' ') 

HAS_SECONDARY=$(xrandr | grep $SECONDARY_MONITOR | cut -f 2 -d ' ')
BSPC_MONITORS=$(bspc query -M | wc -l)

DESKTOPS_SET_1="term browser code sns images"
DESKTOPS_SET_2="term1 browser1 code1 misc0 misc1"

echo "HAS_SECONDARY=$HAS_SECONDARY"
echo "BSPC_MONITORS=$BSPC_MONITORS"


if [ $BSPC_MONITORS -eq 1 ]; then
  if [ "$HAS_SECONDARY" != "connected" ]; then
    echo "All desktops are already in the monitor PRIMARY"
    bspc query -T -m $PRIMARY_MONITOR | jq
  else
    for DESKTOP in $DESKTOPS_SET_2
      do
        echo "Moving $DESKTOP to monitor $SECONDARY_MONITOR"
        bspc desktop $DESKTOP --to-monitor $SECONDARY_MONITOR
      done
    bspc desktop Desktop --remove
  fi
fi

if [ $BSPC_MONITORS -eq 2 ]; then
  if [ "$HAS_SECONDARY" != "connected" ]; then
    bspc monitor $SECONDARY_MONITOR -a Desktop
    for DESKTOP in $DESKTOPS_SET_2
      do
        echo "Moving $DESKTOP to monitor $PRIMARY_MONITOR"
        bspc desktop $DESKTOP --to-monitor $PRIMARY_MONITOR
      done
    bspc monitor $SECONDARY_MONITOR --remove
  else
    bspc desktop -a Desktop -to-monitor $SECONDARY_MONITOR
    for DESKTOP in $DESKTOPS_SET_2
      do
        echo "Moving $DESKTOP to monitor $SECONDARY_MONITOR"
        bspc desktop $DESKTOP --to-monitor $SECONDARY_MONITOR
      done
    bspc desktop Desktop --remove
  fi
fi
echo "Desktops in the monitor PRIMARY"
bspc query -T -m $PRIMARY_MONITOR | jq -r '[.desktops[] | {desktop: .name}]'
echo "Desktops in the monitor SECONDARY"
bspc query -T -m $SECONDARY_MONITOR | jq -r '[.desktops[] | {desktop: .name}]'
feh --bg-fill /home/ajramos/Pictures/city.jpg &
