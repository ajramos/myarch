#!/usr/bin/env bash

NOTIFY_ICON=$HOME/.config/dunst/critical.png

get_total_updates() { UPDATES=$(~/.config/polybar/scripts/checkupdates 2>/dev/null | wc -l); }

get_total_updates

# notify user of updates
if hash notify-send &>/dev/null; then
  if (( UPDATES > 50 )); then
    notify-send -u critical -i $NOTIFY_ICON \
      "You really need to update!!" "$UPDATES New packages"
  elif (( UPDATES > 25 )); then
    notify-send -u normal -i $NOTIFY_ICON \
      "You should update soon" "$UPDATES New packages"
  elif (( UPDATES > 2 )); then
    notify-send -u low -i $NOTIFY_ICON \
      "$UPDATES New packages"
  fi
fi

# when there are updates available
# every 10 seconds another check for updates is done
if (( UPDATES == 1 )); then
  echo " $UPDATES"
elif (( UPDATES > 1 )); then
  echo " $UPDATES"
else
  echo " None"
fi
