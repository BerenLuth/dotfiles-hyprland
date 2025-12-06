#!/bin/bash

volume=$(wpctl get-volume @DEFAULT_SOURCE@ | awk '{print $2*100}')
node_name=$(wpctl inspect @DEFAULT_SOURCE@ -r | awk -F'=' '/node.nick/ {gsub(/\s*"\s*/,"");print $2}')
class=$(pactl get-source-mute @DEFAULT_SOURCE@ | awk '{print $2}')
if [ "$class" == "yes" ] || [ "$volume" == "0" ]
then
    class="muted"
    icon="󰍭"
else
    class="unmuted"
    icon="󰍬"
fi
echo "{\"text\":\"$icon ${volume}%\",\"tooltip\":\"$node_name ${volume}%\",\"percentage\": $volume, \"node_name\": \"$node_name\", \"class\": \"$class\", \"alt\": \"$class\"}"
