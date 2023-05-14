#!/bin/sh

COMMAND=$1
BTACTIVE=$(systemctl status bluetooth | grep Active | sed -e 's/\s*Active:\s//g' \
        | awk '{ split($0,a," "); print a[1]}')


if [ "$BTACTIVE" = "active" ]; then
  if [ "$COMMAND" = "status" ]; then
    if [ $(bluetoothctl show | grep "Powered: yes" | wc -c) -eq 0 ]; then
      echo "%{F#ffffff} Off"
    else
      if [ $(echo info | bluetoothctl | grep 'Device' | wc -c) -eq 0 ]; then 
        echo "%{F#43a047} On"
      else
        echo "%{F#43a047} $(echo info | bluetoothctl | grep Name \
                | sed -e 's/\s*Name:\s//g')"
      fi
    fi
  else
    if [ $(bluetoothctl show | grep "Powered: yes" | wc -c) -eq 0 ]; then
      bluetoothctl power on
    else
      bluetoothctl power off
    fi
  fi
else
    echo "%{F#ffffff} Off"
fi


