#!/bin/bash

if [ -z "$1" ]; then
  CURRENT=$(ddcutil --display 1 getvcp 10 | sed -n 's/.*current value = *\([0-9]\+\).*/\1/p')

  if [ "$CURRENT" -eq 100 ]; then
    LEVEL=50
  else
    LEVEL=100
  fi

else
  LEVEL="$1"
fi

for d in 2 1; do
  ddcutil --display "$d" setvcp 10 "$LEVEL"
done

notify-send \
  -a "Brightness" \
  -h string:x-canonical-private-synchronous:brightness \
  -t 1000 \
  "Brightness" "${LEVEL}%"
