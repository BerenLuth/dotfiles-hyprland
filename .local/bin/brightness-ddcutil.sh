#!/bin/bash

# Detect available DDC displays
DISPLAYS=$(ddcutil detect | awk '/Display [0-9]+/ {gsub(":","",$2); print $2}')

# Exit silently if no monitors support DDC/CI
if [ -z "$DISPLAYS" ]; then
  exit 0
fi

if [ -z "$1" ]; then
  CURRENT=$(ddcutil --display 1 getvcp 10 2>/dev/null |
    sed -n 's/.*current value = *\([0-9]\+\).*/\1/p')

  if [ "$CURRENT" -eq 100 ]; then
    LEVEL=50
  else
    LEVEL=100
  fi
else
  LEVEL="$1"
fi

# Apply to all detected displays
for d in $DISPLAYS; do
  ddcutil --display "$d" setvcp 10 "$LEVEL"
done

notify-send \
  -a "Brightness" \
  -h string:x-canonical-private-synchronous:brightness \
  -t 1000 \
  "Brightness" "${LEVEL}%"
