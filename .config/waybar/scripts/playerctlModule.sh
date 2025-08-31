#!/bin/bash

if [[ "$1" == "-t" ]]; then
  if playerctl status &> /dev/null; then
    echo "true"
  else
    echo "false"
  fi
fi

if [[ "$1" == "-a" ]]; then
  if playerctl status &> /dev/null; then
    status=$(playerctl status)
    if [[ "$status" == "Playing" ]]; then
      icon=""
    else
      icon=""
    fi
    echo "$icon $(playerctl metadata title) - $(playerctl metadata artist)"
  else
    echo "No music playing"
  fi
fi