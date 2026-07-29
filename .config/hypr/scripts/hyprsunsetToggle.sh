#!/bin/bash

hyprsunset_is_on() {
    local temp
    temp=$(hyprctl hyprsunset temperature)
    if [ -z "$temp" ] || [ "$temp" -eq "6000" ]; then
        return 1
    fi
    return 0
}




# if --get or -g is passed as an argument, just return if hyprsunset is on or off
if [ "$1" == "--get" ] || [ "$1" == "-g" ]
then
    if hyprsunset_is_on
    then
        echo "{\"text\":\"\",\"tooltip\":\"Click to turn hypersunset off\",\"class\":\"on\",\"alt\":\"on\"}"
    else
        echo "{\"text\":\"\",\"tooltip\":\"Click to turn hypersunset on\",\"class\":\"off\",\"alt\":\"off\"}"
    fi
    exit 0
fi

#if [ "$1" == "off" ]
#then
#    hyprctl hyprsunset identity &
#    # return a json object to be used in waybar
#    # echo "{\"text\":\"\",\"tooltip\":\"Hyprsunset is off\",\"class\":\"off\"}"
#    exit 0
#else
#    # turn on hyprsunset with the given temperature or default to 4000k
#    hyprctl hyprsunset temperature ${1:-4000k} &
#    # return a json object to be used in waybar
#    # echo "{\"text\":\"\",\"tooltip\":\"Hyprsunset is on\",\"class\":\"on\"}"
#    exit 0
#fi


if hyprsunset_is_on
then
    # echo "{\"text\":\"\",\"tooltip\":\"Hyprsunset is off\",\"class\":\"off\"}"
    hyprctl hyprsunset temperature 6000 &
    # return a json object to be used in waybar
else
    hyprctl hyprsunset temperature ${1:-4000k} &
    # return a json object to be used in waybar
    # echo "{\"text\":\"\",\"tooltip\":\"Hyprsunset is on\",\"class\":\"on\"}"
fi
