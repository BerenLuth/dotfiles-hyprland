#!/bin/bash

if [[ "$1" == "-i" ]]; then
  if playerctl status &> /dev/null; then
    url=$(playerctl metadata xesam:url 2> /dev/null || echo "")
    if [[ "$url" == *youtube* ]]; then
      echo "youtube music playing"
      exit 1
    else
      echo "real music playing"
      exit 0
    fi
  else
    exit 1
  fi
fi

if [[ "$1" == "-p" ]]; then
  if playerctl status &> /dev/null; then
    status=$(playerctl status)
    if [[ "$status" == "Playing" ]]; then
      icon=""
    else
      icon=""
    fi
    echo "{\"text\":\"$icon $(playerctl metadata title)\", \"tooltip\":\"$(playerctl metadata artist) - $(playerctl metadata album) ($(playerctl metadata xesam:contentCreated))\", \"class\":\"$status\"}"
  else
    exit 0
  fi
fi

if [[ "$1" == "-t" ]]; then
  if playerctl status &> /dev/null; then
    status=$(playerctl status)
    if [[ "$status" == "Playing" ]]; then
      icon=""
    else
      icon=""
    fi
    echo "{\"text\":\"$icon $(playerctl metadata title) - $(playerctl metadata artist)\", \"tooltip\":\"Click to toggle play/pause\", \"class\":\"$status\"}"
  else
    exit 0
  fi
fi