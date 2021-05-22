#!/bin/sh

COMMAND=$1

if [ "$COMMAND" = "status" ]; then
  if [ $(bluetoothctl show | grep "Powered: yes" | wc -c) -eq 0 ]; then
    echo "%{F#66ffffff} Off"
  else
    if [ $(echo info | bluetoothctl | grep 'Device' | wc -c) -eq 0 ]; then 
      echo " On"
    else
      echo "%{F#2193ff} $(echo info | bluetoothctl | grep Name | sed -e 's/\s*Name:\s//g')"
    fi
  fi
else
  if [ $(bluetoothctl show | grep "Powered: yes" | wc -c) -eq 0 ]; then
    bluetoothctl power on
  else
    bluetoothctl power off
  fi
fi


