#!/bin/sh

COMMAND=$1
EXTERNAL_IP=$(curl -s ifconfig.co)
STATUS=$?        


if [ $STATUS -eq 0 ]; then
    echo "%{F#ffffff} $EXTERNAL_IP"
else
    echo "%{FFF5250} No Internet"
fi


