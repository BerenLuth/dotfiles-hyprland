#!/bin/bash

# check if hyprsunset is running

# if --get or -g is passed as an argument, just return if hyprsunset is on or off

if [ "$1" == "--get" ] || [ "$1" == "-g" ]
then
    if pgrep -x "hyprsunset" > /dev/null
    then
        echo "{\"text\":\"\",\"tooltip\":\"Click to turn hypersunset off\",\"class\":\"on\",\"alt\":\"on\"}"
    else
        echo "{\"text\":\"\",\"tooltip\":\"Click to turn hypersunset on\",\"class\":\"off\",\"alt\":\"off\"}"
    fi
    exit 0
fi

if [ "$1" == "off" ]
then
    hyprctl hyprsunset identity &
    # return a json object to be used in waybar
    # echo "{\"text\":\"\",\"tooltip\":\"Hyprsunset is off\",\"class\":\"off\"}"
    exit 0
else
    # turn on hyprsunset with the given temperature or default to 4000k
    hyprctl hyprsunset temperature ${1:-4000k} &
    # return a json object to be used in waybar
    # echo "{\"text\":\"\",\"tooltip\":\"Hyprsunset is on\",\"class\":\"on\"}"
    exit 0
fi

# OLD VERSION
# better because it checked the current state, but right now it is broken
if pgrep -x "hyprsunset" > /dev/null
then
    # echo "{\"text\":\"\",\"tooltip\":\"Hyprsunset is off\",\"class\":\"off\"}"
    hyprctl hyprsunset identity &
    # return a json object to be used in waybar
else
    hyprctl hyprsunset temperature ${1:-4000k} &
    # return a json object to be used in waybar
    # echo "{\"text\":\"\",\"tooltip\":\"Hyprsunset is on\",\"class\":\"on\"}"
fi
