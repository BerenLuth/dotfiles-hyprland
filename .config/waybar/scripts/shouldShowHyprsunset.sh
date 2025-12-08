#!/usr/bin/env bash

# always show the hyprsunset icon during the day in waybar
exit 0

# Get the current hour
current_hour=$(date +"%H")

# Check if the current time is between 4 AM and 6 PM
if [ "$current_hour" -ge 4 ] && [ "$current_hour" -lt 18 ]; then
  exit 1
else
  # Execute the "which hyprsunset" command
  which hyprsunset
fi
